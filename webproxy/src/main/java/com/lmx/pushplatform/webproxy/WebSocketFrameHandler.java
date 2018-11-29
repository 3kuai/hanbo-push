package com.lmx.pushplatform.webproxy;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.Client;
import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.proto.PushRequest;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import io.netty.util.AttributeKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ChannelHandler.Sharable
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketFrameHandler.class);
    private Map<String, ClientDelegate> pushClientMap = new ConcurrentHashMap<>(12);
    private Map<String, ClientDelegate> imClientMap = new ConcurrentHashMap<>(12);
    private Map<String, ChannelHandlerContext> channelHandlerContextMap = new ConcurrentHashMap<>(12);
    private AttributeKey<String> attributeKey = AttributeKey.newInstance("regIdentify");
    private AttributeKey<String> attributeAppKey = AttributeKey.newInstance("regAppIdentify");

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
        /**
         * 注册ws连接
         * <P>
         * 同时代理连接去访问推送服务，建立一个多级管道接受数据
         * </P>
         */
        if (frame instanceof TextWebSocketFrame) {
            String request = ((TextWebSocketFrame) frame).text();
            PushRequest pushRequest = JSONObject.parseObject(request, PushRequest.class);
            //心跳
            if (pushRequest.getMsgType() == 3) {
                TextWebSocketFrame textWebSocketFrame = new TextWebSocketFrame("{\"messageContent\":\"pong\"}");
                ctx.writeAndFlush(textWebSocketFrame);
                return;
            }
            //推送消息
            if (pushRequest.getMsgType() == 0 && pushRequest.getPushType() == 1) {
                String appKey = pushRequest.getAppKey();
                if (!pushClientMap.containsKey(appKey)) {
                    ctx.channel().attr(attributeAppKey).set(appKey);
                    //注册ws客户端回调
                    ClientDelegate clientDelegate = new ClientDelegate(ctx);
                    pushClientMap.put(appKey, clientDelegate);
                } else {
                    ClientDelegate clientDelegate = pushClientMap.get(appKey);
                    for (Client client : clientDelegate.getClients()) {
                        client.addCallBack(ctx);
                    }
                }
                PushRequest regApp = new PushRequest();
                regApp.setMsgType(0);
                regApp.setFromId(appKey);
                //注册proxy client发送注册路由请求
                pushClientMap.get(appKey).sendOnly(regApp);
            }
            //IM注册
            else if (pushRequest.getMsgType() == 0 && pushRequest.getPushType() == 2) {
                {
                    String fromId = pushRequest.getFromId();
                    if (!channelHandlerContextMap.containsKey(fromId)) {
                        //注册ws客户端回调
                        ClientDelegate clientDelegate = new ClientDelegate(ctx);
                        ctx.channel().attr(attributeKey).set(fromId);
                        channelHandlerContextMap.put(fromId, ctx);
                        PushRequest regApp = new PushRequest();
                        regApp.setMsgType(0);
                        regApp.setFromId(fromId);
                        imClientMap.put(fromId, clientDelegate);
                        //注册proxy client发送注册路由请求
                        clientDelegate.sendOnly(regApp);
                    }
                }
            }
            //IM消息
            else if (pushRequest.getMsgType() == 1 && pushRequest.getPushType() == 2) {
                PushRequest imMsg = new PushRequest();
                imMsg.setMsgType(pushRequest.getMsgType());
                imMsg.setMsgContent(pushRequest.getMsgContent());
                String toID = pushRequest.getToId().remove(0);
                imMsg.setToId(Lists.newArrayList(toID));
                imClientMap.get(toID).sendOnly(imMsg);
            }
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        super.channelInactive(ctx);
        close(ctx);
    }


    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        LOGGER.error("", cause);
        close(ctx);
    }

    void close(ChannelHandlerContext ctx) {
        //关闭ws连接
        ctx.close();
        //IM卸载
        if (channelHandlerContextMap.values().contains(ctx)) {
            //卸载ws路由
            channelHandlerContextMap.values().remove(ctx);
            String regId = ctx.channel().attr(attributeKey).get();
            //卸载ws回调
            imClientMap.get(regId).removeImCallBackChannel(ctx);
            //卸载代理连接
            imClientMap.remove(regId);
            return;
        }
        //推送卸载
        String appKey = ctx.channel().attr(attributeAppKey).get();
        if (appKey != null && pushClientMap.containsKey(appKey)) {
            pushClientMap.get(appKey).removeAppCallBackChannel(ctx);
            pushClientMap.remove(appKey);
        }
    }
}