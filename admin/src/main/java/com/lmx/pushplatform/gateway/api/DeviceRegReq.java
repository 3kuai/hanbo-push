package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 设备注册，用于推送
 */
@Data
public class DeviceRegReq {

    private String deviceId,
            appId;
    private int platform = 1;//1=安卓，2=ios，3=web
    private int type = 1;//1=注册，2=解绑
}
