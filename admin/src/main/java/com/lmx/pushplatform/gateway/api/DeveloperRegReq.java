package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 开发者注册
 */
@Data
public class DeveloperRegReq {

    private String userName, password;
}
