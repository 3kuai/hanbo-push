package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 群组注册，用于群聊推送
 */
@Data
public class GroupRegReq {

    private String userId, groupName;
}
