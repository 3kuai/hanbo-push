package com.lmx.pushplatform.proto;

import java.util.List;

public class PushResponse {
    private String requestId;
    private int msgType;//0=注册，1=消息,2=内部事件（路由转发）,3=心跳
    private int pushType = 1;//1=推送，2=IM
    private int platform = 1;//默认1=安卓，2=ios，0=全平台
    private String fromId;
    private List<String> toId;
    private String msgContent;
    private String appKey;

    public int getPushType() {
        return pushType;
    }

    public void setPushType(int pushType) {
        this.pushType = pushType;
    }

    public int getPlatform() {
        return platform;
    }

    public void setPlatform(int platform) {
        this.platform = platform;
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public List<String> getToId() {
        return toId;
    }

    public void setToId(List<String> toId) {
        this.toId = toId;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    @Override
    public String toString() {
        return "PushResponse{" +
                "requestId='" + requestId + '\'' +
                ", msgType=" + msgType +
                ", pushType=" + pushType +
                ", platform=" + platform +
                ", fromId='" + fromId + '\'' +
                ", toId=" + toId +
                ", msgContent='" + msgContent + '\'' +
                ", appKey='" + appKey + '\'' +
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
