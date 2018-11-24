package com.lmx.pushplatform.server;

import com.google.common.collect.Lists;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
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
    private Map<ChannelHandlerContext, String> channelHandlerContextMap_ = new ConcurrentHashMap<>(12);
    private Map<String, RouterClient> clientMap = new ConcurrentHashMap<>(2);
    private static final String KEY_PREFIX = "push:user:";

    public ServerHandler() {
        jedis = new Jedis();
        jedis.setDataSource(new JedisPool(new JedisPoolConfig(),
                System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port"))));
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, PushRequest request) throws Exception {
        LOGGER.debug("request is {}", request);
        ctx.writeAndFlush(request);
        switch (request.getMsgType()) {
            /**
             *  注册事件:
             *      1、本地注册表维护连接；
             *      2、redis记录路由关系
             *
             * */
            case 0:
                channelHandlerContextMap.put(request.getFromId(), ctx);
                channelHandlerContextMap_.put(ctx, request.getFromId());
                jedis.set(KEY_PREFIX + request.getFromId(), Server.host + ":" + Server.port);
                LOGGER.info("reg channel is {}", ctx.channel());
                break;
            /**
             *  消息事件：
             *  检查本地连接表，如果没有查询redis取出路由地址，把请求转发到其他server去处理
             *
             */
            case 1:
                if (request.getToId() == null) {
                    return;
                }
                for (String toId : request.getToId()) {
                    if (channelHandlerContextMap.containsKey(toId)) {
                        PushResponse pushResponse = new PushResponse(request.getMsgContent());
                        LOGGER.info("send dest response is {}", pushResponse);
                        channelHandlerContextMap.get(toId).writeAndFlush(pushResponse);
                    } else {
                        String hostAddress = jedis.get(KEY_PREFIX + toId);
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
            case 2:
                for (String toId : request.getToId()) {
                    PushResponse pushResponse = new PushResponse(request.getMsgContent());
                    LOGGER.info("router response is {}", pushResponse);
                    channelHandlerContextMap.get(toId).writeAndFlush(pushResponse);
                }
                break;
        }
    }


    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        String userId = channelHandlerContextMap_.remove(ctx);
        jedis.del(KEY_PREFIX + userId);
        channelHandlerContextMap.remove(userId);
    }
}
