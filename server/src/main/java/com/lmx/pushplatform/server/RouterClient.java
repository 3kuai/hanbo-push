package com.lmx.pushplatform.server;

import com.lmx.pushplatform.proto.PushDecoder;
import com.lmx.pushplatform.proto.PushEncoder;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;

public class RouterClient extends SimpleChannelInboundHandler<PushResponse> {

    private Channel channel;

    public void initConn(String host, int port) {
        EventLoopGroup group = new NioEventLoopGroup(Runtime.getRuntime().availableProcessors() * 2);
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(group).channel(NioSocketChannel.class).handler(new ChannelInitializer<SocketChannel>() {
            @Override
            public void initChannel(SocketChannel channel) throws Exception {
                channel.pipeline()
                        .addLast(new PushEncoder(PushRequest.class))
                        .addLast(new PushDecoder(PushResponse.class))
                        .addLast(RouterClient.this);
            }
        }).option(ChannelOption.TCP_NODELAY, true);
        try {
            ChannelFuture future = bootstrap.connect(host, port).sync();
            channel = future.channel();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, PushResponse msg) throws Exception {

    }

    /***
     * 广播消息,单发即可
     * @param pushRequest
     */
    public void send(PushRequest pushRequest) {
        channel.writeAndFlush(pushRequest);
    }
}
