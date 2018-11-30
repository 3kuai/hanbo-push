package com.lmx.pushplatform.server;

import com.lmx.pushplatform.proto.PushDecoder;
import com.lmx.pushplatform.proto.PushEncoder;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PushServer {

    private static final Logger LOGGER = LoggerFactory.getLogger(PushServer.class);
    private EventLoopGroup bossGroup = new NioEventLoopGroup();
    private EventLoopGroup workerGroup = new NioEventLoopGroup(Runtime.getRuntime().availableProcessors() * 2);
    public static String host = System.getProperty("host");
    public static String port = System.getProperty("port");

    public PushServer(String serverAddress, int port) throws Exception {

        ServerBootstrap bootstrap = new ServerBootstrap();
        final PushServerHandler serverHandler = new PushServerHandler();
        bootstrap.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class)
                .childHandler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    public void initChannel(SocketChannel channel) throws Exception {
                        channel.pipeline()
                                .addLast(new PushDecoder(PushRequest.class))
                                .addLast(new PushEncoder(PushResponse.class))
                                .addLast(serverHandler);
                    }
                }).option(ChannelOption.SO_BACKLOG, 128).childOption(ChannelOption.TCP_NODELAY, true);

        ChannelFuture future = bootstrap.bind(serverAddress, port).sync();
        LOGGER.info("push-server started on port {}", port);
        future.channel().closeFuture().sync();
    }

    public void shutdown() {
        workerGroup.shutdownGracefully();
        bossGroup.shutdownGracefully();
    }

    public static void main(String[] args) {
        PushServer server = null;
        try {
            ServiceRegister.exposeApp();
            server = new PushServer(host, Integer.parseInt(port));
        } catch (Exception e) {
            LOGGER.error("", e);
            if (server != null)
                server.shutdown();
        }
    }

}
