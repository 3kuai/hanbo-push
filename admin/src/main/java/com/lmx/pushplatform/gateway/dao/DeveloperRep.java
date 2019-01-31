package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.DeveloperEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeveloperRep extends JpaRepository<DeveloperEntity, Long> {

    DeveloperEntity findByDeveloperAndPassword(String a, String b);
}