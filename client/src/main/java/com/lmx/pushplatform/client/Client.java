package com.lmx.pushplatform.client;

import com.alibaba.fastjson.JSONObject;
import com.lmx.pushplatform.proto.PushDecoder;
import com.lmx.pushplatform.proto.PushEncoder;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class Client extends SimpleChannelInboundHandler<PushResponse> {

    private Channel channel;
    private final Map<String, SendFuture> SEND_FUTURE_MAP = new ConcurrentHashMap<>();
    private final long MAX_WAIT = 10 * 1000;
    private final Logger LOGGER = LoggerFactory.getLogger(Client.class);
    private String host;
    private int port;
    private List<ChannelHandlerContext> destChannels = new CopyOnWriteArrayList<>();

    @Override
    public String toString() {
        return host + ":" + port;
    }

    public void addCallBack(ChannelHandlerContext context) {
        this.destChannels.add(context);
    }

    public void initConn(String host, int port, ChannelHandlerContext channel) {
        this.destChannels.add(channel);
        this.initConn(host, port);
    }

    public void initConn(String host, int port) {
        EventLoopGroup group = new NioEventLoopGroup(Runtime.getRuntime().availableProcessors() * 2);
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(group).channel(NioSocketChannel.class).handler(new ChannelInitializer<SocketChannel>() {
            @Override
            public void initChannel(SocketChannel channel) throws Exception {
                channel.pipeline()
                        .addLast(new PushEncoder(PushRequest.class))
                        .addLast(new PushDecoder(PushResponse.class))
                        .addLast(Client.this);
            }
        }).option(ChannelOption.TCP_NODELAY, true);
        try {
            this.host = host;
            this.port = port;
            ChannelFuture future = bootstrap.connect(host, port).sync();
            channel = future.channel();
            LOGGER.info("connect ok {}", channel);
        } catch (InterruptedException e) {
            LOGGER.error("", e);
        }
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, PushResponse response) throws Exception {
        String seqNo = response.getRequestId();
        if (seqNo == null) {
            for (ChannelHandlerContext channel : destChannels) {
                //坏连接则剔除
                if (!channel.channel().isOpen()) {
                    destChannels.remove(channel);
                    continue;
                }
                TextWebSocketFrame textWebSocketFrame = new TextWebSocketFrame(JSONObject.toJSONString(response));
                channel.writeAndFlush(textWebSocketFrame);
            }
            LOGGER.info("receive message={}", response);
            return;
        }
        SendFuture future = SEND_FUTURE_MAP.remove(seqNo);
        if (future != null) {
            future.setResponse(response);
            future.isDone();
        }
    }

    public PushResponse sendAndGet(PushRequest request) throws Exception {
        SendFuture future = new SendFuture();
        future.setCd(new CountDownLatch(1));
        SEND_FUTURE_MAP.put(request.getRequestId(), future);
        LOGGER.debug("req is:{}", request);
        checkConn();
        channel.writeAndFlush(request);
        PushResponse response = future.get(MAX_WAIT, TimeUnit.MILLISECONDS);
        if (response != null) {
            return response;
        }
        return null;
    }

    public void sendOnly(PushRequest request) throws Exception {
        LOGGER.debug("req:{}", request);
        checkConn();
        channel.writeAndFlush(request);
    }

    void checkConn() throws Exception {
        if (!channel.isOpen())
            throw new Exception("conn is close");
    }
}
