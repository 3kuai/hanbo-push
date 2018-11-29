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
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ChannelHandler.Sharable
public class ServerHandler extends SimpleChannelInboundHandler<PushRequest> {

    private static final Logger LOGGER = LoggerFactory.getLogger(ServerHandler.class);
    private Jedis jedis;
    private Map<String, ChannelHandlerContext> channelHandlerContextMap = new ConcurrentHashMap<>(12);
    private AttributeKey<String> attributeKey = AttributeKey.newInstance("regIdentify");
    private Map<String, RouterClient> clientMap = new ConcurrentHashMap<>(2);
    private static final String SPLITTER = ":";
    private static final String PUSH_KEY_PREFIX = "push" + SPLITTER + "user" + SPLITTER;
    private static final String IM_KEY_PREFIX = "im" + SPLITTER + "user" + SPLITTER;

    public ServerHandler() {
        jedis = new Jedis();
        jedis.setDataSource(new JedisPool(new JedisPoolConfig(),
                System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port"))));
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, PushRequest request) throws Exception {
        LOGGER.info("request is {}", request);
        switch (PushRequest.MessageType.getMessageType(request.getMsgType())) {
            /**
             *  注册事件:
             *      1、本地注册表维护连接；
             *      2、redis记录路由关系
             *
             * */
            case REGISTY:
                String regId = request.getFromId();
                String realRegId = null;
                //推送
                if (request.getPushType() == PushRequest.PushType.PUSH.ordinal()) {
                    realRegId = request.getAppKey() + SPLITTER + PUSH_KEY_PREFIX + regId;
                }//IM
                else if (request.getPushType() == PushRequest.PushType.IM.ordinal()) {
                    realRegId = request.getAppKey() + SPLITTER + IM_KEY_PREFIX + regId;
                }
                channelHandlerContextMap.put(realRegId, ctx);
                ctx.channel().attr(attributeKey).set(realRegId);
                jedis.set(realRegId, Server.host + SPLITTER + Server.port);
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
                    String pushToId = null;
                    //推送
                    if (request.getPushType() == PushRequest.PushType.PUSH.ordinal()) {
                        pushToId = request.getAppKey() + SPLITTER + PUSH_KEY_PREFIX + toId;
                    }
                    //IM
                    else if (request.getPushType() == PushRequest.PushType.IM.ordinal()) {
                        pushToId = request.getAppKey() + SPLITTER + IM_KEY_PREFIX + toId;
                    }
                    if (channelHandlerContextMap.containsKey(pushToId)) {
                        PushResponse pushResponse = new PushResponse(request.getMsgContent());
                        LOGGER.info("send dest response is {}", pushResponse);
                        channelHandlerContextMap.get(pushToId).writeAndFlush(pushResponse);
                    } else {
                        String hostAddress = jedis.get(pushToId);
                        request.setToId(Lists.newArrayList(toId));
                        request.setMsgType(2);
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
                    String pushToId = null;
                    //推送
                    if (request.getPushType() == PushRequest.PushType.PUSH.ordinal()) {
                        pushToId = request.getAppKey() + SPLITTER + PUSH_KEY_PREFIX + toId;
                    }
                    //IM
                    else if (request.getPushType() == PushRequest.PushType.IM.ordinal()) {
                        pushToId = request.getAppKey() + SPLITTER + IM_KEY_PREFIX + toId;
                    }
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
        ctx.close();
        String id = ctx.channel().attr(attributeKey).get();
        if (id != null) {
            jedis.del(id);
            channelHandlerContextMap.remove(id);
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        LOGGER.error("", cause);
        ctx.close();
        String id = ctx.channel().attr(attributeKey).get();
        if (id != null) {
            jedis.del(id);
            channelHandlerContextMap.remove(id);
        }
    }

}
