package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 移动设备注册，用于设备推送
 */
@Data
public class MobileRegReq {

    private String remoteIp, appName,
            developer, appKey, appSecret;
}
