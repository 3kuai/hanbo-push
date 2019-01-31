package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.AppEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppRep extends JpaRepository<AppEntity, Long> {

    AppEntity findAppEntityByAppNameAndAppKeyAndAppSecret(String a, String b, String c);
    AppEntity findByAppName(String a);
}