package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 用户加好友
 */
@Data
public class UserFollowRegReq {

    private String userId, userFollowId;
    private int state = 1;//1=加好友，2=解除好友
}
