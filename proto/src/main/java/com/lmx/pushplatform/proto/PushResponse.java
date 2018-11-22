package com.lmx.pushplatform.proto;

public class PushResponse {
    private String requestId;
    private String msgContent;
    private int msgType = 0;

    @Override
    public String toString() {
        return "PushResponse{" +
                "requestId='" + requestId + '\'' +
                ", msgContent='" + msgContent + '\'' +
                ", msgType=" + msgType +
                '}';
    }

    public PushResponse(String requestId, String msgContent) {
        this.requestId = requestId;
        this.msgContent = msgContent;
    }

    public PushResponse(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public int getMsgType() {
        return msgType;
    }

    public void setMsgType(int msgType) {
        this.msgType = msgType;
    }
}
