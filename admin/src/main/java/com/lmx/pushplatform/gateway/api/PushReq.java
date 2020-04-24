package com.lmx.pushplatform.gateway.api;

import lombok.Data;

import java.util.Map;

@Data
public class PushReq {
    private Integer platform = 1, start, length, msgId, type;//默认1=安卓，2=ios，0=全平台
    private String messageUrl;//富文本需要传
    private String messageContent, messageTitle, appName;
    private Map search;
}
