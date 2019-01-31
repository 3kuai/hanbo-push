package com.lmx.pushplatform.gateway.common;

import com.google.common.collect.Sets;
import com.lmx.pushplatform.gateway.dao.GroupMemberRep;
import com.lmx.pushplatform.gateway.dao.GroupRep;
import com.lmx.pushplatform.gateway.entity.GroupEntity;
import com.lmx.pushplatform.gateway.entity.GroupMembersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * Created by Administrator on 2018/11/23.
 */
@Service
public class CommonService {
    @Autowired
    private GroupRep groupRep;
    @Autowired
    private GroupMemberRep groupMemberRep;

    public Set<String> getGroupMembersById(String groupId) {
        GroupEntity groupEntity = groupRep.findOne(Long.parseLong(groupId));
        Set<GroupMembersEntity> groupMembersEntities = groupEntity.getGroupMembersEntitySet();
        Set<String> sets = Sets.newHashSet();
        for (GroupMembersEntity u : groupMembersEntities) {
            sets.add(u.getUserId());
        }
        return sets;
    }
}
