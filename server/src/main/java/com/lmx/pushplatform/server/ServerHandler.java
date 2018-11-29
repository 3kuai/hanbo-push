package com.lmx.pushplatform.server;

import com.google.common.collect.Lists;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.util.AttributeKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ChannelHandler.Sharable
public class ServerHandler extends SimpleChannelInboundHandler<PushRequest> {

    private static final Logger LOGGER = LoggerFactory.getLogger(ServerHandler.class);
    /**
     * 本地路由表
     */
    private Map<String, ChannelHandlerContext> channelHandlerContextMap = new ConcurrentHashMap<>(12);
    private AttributeKey<String> attributeKey = AttributeKey.newInstance("regIdentify");
    private Map<String, RouterClient> clientMap = new ConcurrentHashMap<>(2);

    public ServerHandler() {
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, PushRequest request) throws Exception {
        LOGGER.info("request is {}", request);
        switch (PushRequest.MessageType.getMessageType(request.getMsgType())) {
            /**
             *  注册路由事件:
             *      1、本地路由表维护连接；
             *      2、redis记录路由关系
             *
             * */
            case REGISTY:
                String realRegId = RouterManager.regRouter(request);
                channelHandlerContextMap.put(realRegId, ctx);
                ctx.channel().attr(attributeKey).set(realRegId);
                LOGGER.info("reg channel is {}", ctx.channel());
                break;
            /**
             *  消息事件：
             *  检查本地连接表，如果没有查询redis取出路由地址，把请求转发到其他server去处理
             *
             */
            case DILIVERY_MSG:
                if (request.getToId() == null) {
                    return;
                }
                for (String toId : request.getToId()) {
                    String pushToId = RouterManager.getLocalRouter(request, toId);
                    if (channelHandlerContextMap.containsKey(pushToId)) {
                        PushResponse pushResponse = new PushResponse(request.getMsgContent());
                        LOGGER.info("send dest response is {}", pushResponse);
                        channelHandlerContextMap.get(pushToId).writeAndFlush(pushResponse);
                    } else {
                        String hostAddress = RouterManager.getRedisRouter(request, toId);
                        request.setToId(Lists.newArrayList(toId));
                        request.setMsgType(PushRequest.MessageType.ROUTER_FORWAR.ordinal());
                        if (hostAddress == null) {
                            LOGGER.warn("user has no register router...");
                            return;
                        }
                        if (!clientMap.containsKey(hostAddress)) {
                            RouterClient client = new RouterClient();
                            client.initConn(HostAndPort.fromHost(hostAddress).getHostText(),
                                    HostAndPort.fromString(hostAddress).getPort());
                            client.send(request);
                            clientMap.put(hostAddress, client);
                        } else {
                            try {
                                clientMap.get(hostAddress).send(request);
                            } catch (Exception e) {
                                clientMap.remove(hostAddress);
                                throw e;
                            }
                        }
                    }
                    PushResponse pushResponse_ = new PushResponse(request.getRequestId(), "发送成功");
                    LOGGER.info("send origin response is {}", pushResponse_);
                    //回复调用者
                    ctx.writeAndFlush(pushResponse_);
                }
                break;
            /**
             * 内部事件（路由转发）
             */
            case ROUTER_FORWAR:
                for (String toId : request.getToId()) {
                    String pushToId = RouterManager.getLocalRouter(request, toId);
                    PushResponse pushResponse = new PushResponse(request.getMsgContent());
                    LOGGER.info("router response is {}", pushResponse);
                    channelHandlerContextMap.get(pushToId).writeAndFlush(pushResponse);
                }
                break;
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        super.channelInactive(ctx);
        close(ctx);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        LOGGER.error("", cause);
        close(ctx);
    }

    /**
     * 关闭连接，卸载路由
     *
     * @param ctx
     */
    void close(ChannelHandlerContext ctx) {
        ctx.close();
        String id = ctx.channel().attr(attributeKey).get();
        if (id != null) {
            RouterManager.removeRedisRouter(id);
            channelHandlerContextMap.remove(id);
        }
    }

}
