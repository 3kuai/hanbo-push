package com.lmx.pushplatform.server;

import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ChannelHandler.Sharable
public class PushServerHandler extends SimpleChannelInboundHandler<PushRequest> {

    private static final Logger LOGGER = LoggerFactory.getLogger(PushServerHandler.class);

    public PushServerHandler() {
    }

    @Override
    public void channelRead0(final ChannelHandlerContext ctx, PushRequest request) throws Exception {
        LOGGER.info("request is {}", request);
        switch (PushRequest.MessageType.getMessageType(request.getMsgType())) {
            /**
             *  注册路由事件:
             *      1、本地路由表维护连接；
             *      2、redis记录路由关系
             *
             * */
            case REGISTY:
                //仅android注册，ios直接走apns通道
                if (request.getPlatform() == PushRequest.Platform.ANDROID.ordinal())
                    AndroidPushHelper.regChannel(ctx, request);
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
                    //ios推送走apns
                    if (request.getPlatform() == PushRequest.Platform.IOS.ordinal()) {
                        IosPushHelper.sendMsg(toId, "", request.getMsgContent());
                    } else {
                        AndroidPushHelper.sendMsg(request, toId);
                    }
                }
                PushResponse pushResponse_ = new PushResponse(request.getRequestId(), "发送成功");
                LOGGER.info("send origin response is {}", pushResponse_);
                //回复调用者
                ctx.writeAndFlush(pushResponse_);
                break;
            /**
             * 内部事件（路由转发）
             */
            case ROUTER_FORWARD:
                for (String toId : request.getToId()) {
                    AndroidPushHelper.routerSendForward(request, toId);
                }
                break;
        }
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        super.channelActive(ctx);
        LOGGER.info("connected channel={}", ctx.channel());
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        super.channelInactive(ctx);
        LOGGER.info("disconnect channel={}", ctx.channel());
        ctx.close();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        LOGGER.error("", cause);
        AndroidPushHelper.unRegChannel(ctx);
    }

    @Override
    public void channelWritabilityChanged(ChannelHandlerContext ctx) throws Exception {
        ctx.channel().isWritable();
    }
}
