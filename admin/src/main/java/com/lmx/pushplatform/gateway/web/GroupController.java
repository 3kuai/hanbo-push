package com.lmx.pushplatform.gateway.web;

import com.google.common.collect.Sets;
import com.lmx.pushplatform.gateway.api.*;
import com.lmx.pushplatform.gateway.dao.GroupMemberRep;
import com.lmx.pushplatform.gateway.dao.GroupRep;
import com.lmx.pushplatform.gateway.dao.UserRelatedRep;
import com.lmx.pushplatform.gateway.dao.UserRep;
import com.lmx.pushplatform.gateway.entity.GroupEntity;
import com.lmx.pushplatform.gateway.entity.GroupMembersEntity;
import com.lmx.pushplatform.gateway.entity.UserEntity;
import com.lmx.pushplatform.gateway.entity.UserRelatedEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

@RestController
@RequestMapping("/group")
public class GroupController {
    @Autowired
    private GroupRep groupRep;
    @Autowired
    private GroupMemberRep groupMemberRep;

    /**
     * 建群
     *
     * @param groupRegReq
     * @return
     */
    @PostMapping("/create")
    public CommonResp reg(@RequestBody GroupRegReq groupRegReq) {
        groupRep.save(GroupEntity.builder()
                .userId(groupRegReq.getUserId())
                .groupName(groupRegReq.getGroupName())
                .build());
        return CommonResp.defaultSuccess();
    }

    /**
     * 加群
     *
     * @param groupMemberRegReq
     * @return
     */
    @PostMapping("/join")
    public CommonResp follow(@RequestBody GroupMemberRegReq groupMemberRegReq) {
        groupMemberRep.save(GroupMembersEntity.builder()
                .userId(groupMemberRegReq.getUserId())
                .groupId(groupMemberRegReq.getGroupId())
                .build());
        return CommonResp.defaultSuccess();
    }

    /**
     * 群组成员列表
     *
     * @param groupMemberRegReq
     * @return
     */
    @PostMapping("/memberList")
    public CommonResp followList(@RequestBody GroupMemberRegReq groupMemberRegReq) {
        GroupEntity groupEntity = groupRep.findOne(Long.parseLong(groupMemberRegReq.getGroupId()));
        Set<GroupMembersEntity> groupMembersEntities = groupEntity.getGroupMembersEntitySet();
        Set<String> sets = Sets.newHashSet();
        for (GroupMembersEntity u : groupMembersEntities) {
            sets.add(u.getUserId());
        }
        return CommonResp.defaultSuccess(sets);
    }
}
