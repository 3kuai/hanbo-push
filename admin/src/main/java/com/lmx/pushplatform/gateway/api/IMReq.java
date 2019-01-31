package com.lmx.pushplatform.gateway.api;

import lombok.Data;

@Data
public class IMReq {
    private int platform = 1;//默认1=安卓，2=ios，0=全平台
    private String msgUrl;//富文本需要传
    private String msgContent;
    private String fromUserId;
}
