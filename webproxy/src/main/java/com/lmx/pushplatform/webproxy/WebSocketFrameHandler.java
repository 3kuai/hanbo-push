package com.lmx.pushplatform.webproxy;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.Connector;
import com.lmx.pushplatform.client.DynamicConnector;
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
    private Map<String, DynamicConnector> pushClientMap = new ConcurrentHashMap<>(12);
    private Map<String, DynamicConnector> imClientMap = new ConcurrentHashMap<>(12);
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
            //和页面保持心跳
            if (pushRequest.getMsgType() == 3) {
                TextWebSocketFrame textWebSocketFrame = new TextWebSocketFrame("{\"msgContent\":\"pong\",\"msgType\":3}");
                ctx.writeAndFlush(textWebSocketFrame);
                //和push-server保持心跳
                PushRequest regApp = new PushRequest();
                regApp.setMsgType(3);
                regApp.setAppKey(pushRequest.getAppKey());
                regApp.setFromId(pushRequest.getFromId());
                regApp.setPushType(1);
                regApp.setPlatform(3);
                pushClientMap.get(pushRequest.getAppKey()).sendOnly(regApp);
                return;
            }
            //推送消息
            if (pushRequest.getMsgType() == 0 && pushRequest.getPushType() == 1) {
                String appKey = pushRequest.getAppKey();
                if (!pushClientMap.containsKey(appKey)) {
                    ctx.channel().attr(attributeAppKey).set(appKey);
                    //注册ws客户端回调
                    DynamicConnector clientDelegate = new DynamicConnector(pushRequest.getFromId(), ctx);
                    pushClientMap.put(appKey, clientDelegate);
                }
                PushRequest regApp = new PushRequest();
                regApp.setMsgType(0);
                regApp.setAppKey(appKey);
                regApp.setFromId(pushRequest.getFromId());
                regApp.setPlatform(3);
                //注册proxy client发送注册路由请求
                pushClientMap.get(appKey).sendOnly(regApp);
            }
            //IM注册
            else if (pushRequest.getMsgType() == 0 && pushRequest.getPushType() == 2) {
                {
                    String fromId = pushRequest.getFromId();
                    if (!channelHandlerContextMap.containsKey(fromId)) {
                        //注册ws客户端回调
                        DynamicConnector clientDelegate = new DynamicConnector(fromId, ctx);
                        ctx.channel().attr(attributeKey).set(fromId);
                        channelHandlerContextMap.put(fromId, ctx);
                        imClientMap.put(fromId, clientDelegate);
                        //注册proxy client发送注册路由请求
                        clientDelegate.sendOnly(pushRequest);
                    }
                    TextWebSocketFrame textWebSocketFrame = new TextWebSocketFrame(JSONArray.toJSONString(imClientMap.keySet()));
                    ctx.writeAndFlush(textWebSocketFrame);
                }
            }
            //IM消息
            else if (pushRequest.getMsgType() == 1 && pushRequest.getPushType() == 2) {
                String toID = pushRequest.getToId().get(0);
                imClientMap.get(toID).sendOnly(pushRequest);
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