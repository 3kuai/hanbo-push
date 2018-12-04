package com.lmx.pushplatform.proto;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ReplayingDecoder;

import java.util.List;

/**
 * high concurrency suggest ReplayingDecoder,otherwise cause buffer overflow
 */
public class PushDecoder extends ReplayingDecoder {

    private Class<?> genericClass;

    public PushDecoder(Class<?> genericClass) {
        this.genericClass = genericClass;
    }

    @Override
    public final void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
        int dataLength = in.readInt();
        if (dataLength > 1024 * 1024 * 2)
            return;
        byte[] data = new byte[dataLength];
        in.readBytes(data);
        Object obj = SerializationUtil.deserialize(data, genericClass);
        out.add(obj);
    }
}
