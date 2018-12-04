package com.lmx.pushplatform.server;

import com.google.common.collect.Lists;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandlerContext;
import io.netty.util.AttributeKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * android push
 */
public class AndroidPushHelper {
    /**
     * 本地路由表
     */
    private static Map<String, ChannelHandlerContext> channelHandlerContextMap = new ConcurrentHashMap<>(12);
    private static AttributeKey<String> attributeKey = AttributeKey.newInstance("regIdentify");
    private static Map<String, ForwardClient> clientMap = new ConcurrentHashMap<>(2);
    private static Logger LOGGER = LoggerFactory.getLogger(AndroidPushHelper.class);

    public static void regChannel(ChannelHandlerContext ctx, PushRequest request) {
        String realRegId = RouterManager.regRouter(request);
        channelHandlerContextMap.put(realRegId, ctx);
        ctx.channel().attr(attributeKey).set(realRegId);
        LOGGER.info("reg channel is {}", ctx.channel());
    }


    public static void sendMsg(PushRequest request, String toId) {
        String pushToId = RouterManager.getLocalRouter(request, toId);
        if (channelHandlerContextMap.containsKey(pushToId)) {
            PushResponse pushResponse = new PushResponse(request.getMsgContent());
            pushResponse.setAppKey(request.getAppKey());
            pushResponse.setFromId(request.getFromId());
            pushResponse.setToId(request.getToId());
            pushResponse.setMsgType(request.getMsgType());
            LOGGER.info("send dest response is {}", pushResponse);
            channelHandlerContextMap.get(pushToId).writeAndFlush(pushResponse);
        } else {
            String hostAddress = RouterManager.getRedisRouter(request, toId);
            request.setToId(Lists.newArrayList(toId));
            request.setMsgType(PushRequest.MessageType.ROUTER_FORWARD.ordinal());
            if (hostAddress == null) {
                LOGGER.warn("user has no register router...");
                return;
            }
            if (!clientMap.containsKey(hostAddress)) {
                ForwardClient client = new ForwardClient();
                client.initConn(HostAndPort.fromHost(hostAddress).getHostText(),
                        HostAndPort.fromString(hostAddress).getPort());
                client.send(request);
                clientMap.put(hostAddress, client);
            } else {
                try {
                    clientMap.get(hostAddress).send(request);
                } catch (Exception e) {
                    LOGGER.error("", e);
                    clientMap.remove(hostAddress);
                    throw e;
                }
            }
        }
    }

    public static void routerSendForward(PushRequest request, String toId) {
        if (request.getPlatform() == PushRequest.Platform.IOS.ordinal()) {
            ApnsPushHelper.sendMsg(toId, "", request.getMsgContent());
        } else {
            String pushToId = RouterManager.getLocalRouter(request, toId);
            PushResponse pushResponse = new PushResponse(request.getMsgContent());
            pushResponse.setAppKey(request.getAppKey());
            pushResponse.setFromId(request.getFromId());
            pushResponse.setToId(request.getToId());
            pushResponse.setMsgType(request.getMsgType());
            LOGGER.info("router response is {}", pushResponse);
            channelHandlerContextMap.get(pushToId).writeAndFlush(pushResponse);
        }
    }

    /**
     * 关闭连接，卸载路由
     *
     * @param ctx
     */
    public static void unRegChannel(ChannelHandlerContext ctx) {
        ctx.close();
        String id = ctx.channel().attr(attributeKey).get();
        if (id != null) {
            RouterManager.removeRedisRouter(id);
            channelHandlerContextMap.remove(id);
        }
    }
}
