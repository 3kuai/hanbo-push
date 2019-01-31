package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.GroupMembersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GroupMemberRep extends JpaRepository<GroupMembersEntity, Long> {

}