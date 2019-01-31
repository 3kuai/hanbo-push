package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 用户注册，用于点对点推送（聊天）
 */
@Data
public class UserRegReq {

    private String userName, appId;
}
