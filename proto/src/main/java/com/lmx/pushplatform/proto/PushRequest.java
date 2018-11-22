package com.lmx.pushplatform.proto;

import java.util.concurrent.atomic.AtomicInteger;

public class PushRequest {
    private String requestId;
    private int msgType;//0=注册，1=消息,2=内部事件（路由转发）
    private String fromId;
    private String toId;
    private String msgContent;
    private static final AtomicInteger atomicInteger = new AtomicInteger(1);

    public PushRequest() {
        requestId = String.valueOf(atomicInteger.incrementAndGet());
    }

    @Override
    public String toString() {
        return "PushRequest{" +
                "requestId='" + requestId + '\'' +
                ", msgType=" + msgType +
                ", fromId='" + fromId + '\'' +
                ", toId='" + toId + '\'' +
                ", msgContent='" + msgContent + '\'' +
                '}';
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public int getMsgType() {
        return msgType;
    }

    public void setMsgType(int msgType) {
        this.msgType = msgType;
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public String getToId() {
        return toId;
    }

    public void setToId(String toId) {
        this.toId = toId;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }
}
