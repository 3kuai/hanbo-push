package com.lmx.pushplatform.gateway.api;

import lombok.Data;

@Data
public class PushReq {
    private int platform = 1;//默认1=安卓，2=ios，0=全平台
    private String messageUrl;//富文本需要传
    private String messageContent,messageTitle;
    private String appName;
}
