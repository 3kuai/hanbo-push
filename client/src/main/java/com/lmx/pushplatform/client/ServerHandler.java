package com.lmx.pushplatform.client;

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

@ChannelHandler.Sharable
public class ServerHandler extends SimpleChannelInboundHandler<PushRequest> {

    private static final Logger LOGGER = LoggerFactory.getLogger(ServerHandler.class);
    private Jedis jedis;
    private ClientDelegate clientDelegate = new ClientDelegate();

    public ServerHandler() {
        jedis = new Jedis();
        jedis.setDataSource(new JedisPool(new JedisPoolConfig(),
                System.getProperty("redis.host"), Integer.parseInt(System.getProperty("redis.port"))));
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, PushRequest request) throws Exception {
        LOGGER.debug("request is {}", request);
        //处理消息
        switch (request.getMsgType()) {
            case 1:
                //处理发送消息，广播给pushServer，不回复客户端
                clientDelegate.sendOnly(request);
                break;
            case 3:
                //处理心跳，返回客户端
                PushResponse pushResponse = new PushResponse("pong");
                ctx.writeAndFlush(pushResponse);
                break;
        }

    }


    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        ctx.close();
    }
}
