package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRep extends JpaRepository<UserEntity, Long> {
}