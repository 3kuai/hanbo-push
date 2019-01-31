package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.GroupEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GroupRep extends JpaRepository<GroupEntity, Long> {

}