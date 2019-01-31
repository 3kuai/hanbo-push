package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 移动设备注册，用于设备推送
 */
@Data
public class MobileRegReq {

    private String appName,
            developer, appKey, appSecret;
}
