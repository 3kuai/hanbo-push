package com.lmx.pushplatform.gateway.api;

import lombok.Data;

/**
 * 群组加人
 */
@Data
public class GroupMemberRegReq {

    private String userId, groupId;
}
