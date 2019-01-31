package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.UserRelatedEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRelatedRep extends JpaRepository<UserRelatedEntity, Long> {

}