package com.lmx.pushplatform.webproxy;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.net.HostAndPort;
import com.lmx.pushplatform.client.Client;
import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.proto.PushRequest;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.CloseWebSocketFrame;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Echoes uppercase content of text frames.
 */
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketFrameHandler.class);
    /**
     * appKey映射多个客户端
     */
    private Map<String, List<ChannelHandlerContext>> channelHandlerContextMap = new ConcurrentHashMap<>(12);
    private Map<String, ClientProxy> clientProxyMap = new ConcurrentHashMap<>(12);
    private ClientDelegate clientDelegate = new ClientDelegate();

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
            String appKey = pushRequest.getAppKey();
            if (!channelHandlerContextMap.containsKey(appKey)) {
                channelHandlerContextMap.put(appKey, Lists.newArrayList(ctx));
                //随机取一个客户端连接
                clientDelegate.getClients();
                List<Client> clients = clientDelegate.getClients();
                int val = (int) System.currentTimeMillis() % clients.size();
                String clientInfo = clients.get(Math.abs(val)).toString();
                ClientProxy clientProxy = new ClientProxy(HostAndPort.fromString(clientInfo).getHostText(),
                        HostAndPort.fromString(clientInfo).getPort(), ctx);
                clientProxyMap.put(appKey, clientProxy);
            } else {
                channelHandlerContextMap.get(appKey).add(ctx);
                clientProxyMap.get(appKey).addClient(ctx);
            }
            PushRequest regApp = new PushRequest();
            regApp.setMsgType(0);
            regApp.setFromId(appKey);
            //注册proxy client
            clientProxyMap.get(appKey).sendOnly(regApp);
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        LOGGER.error("", cause);
        ctx.close();
        //卸载连接
        if (channelHandlerContextMap.values().contains(ctx)) {
            channelHandlerContextMap.values().remove(ctx);
        }
    }
}