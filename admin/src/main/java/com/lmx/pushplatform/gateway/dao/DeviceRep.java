package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.DeviceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceRep extends JpaRepository<DeviceEntity, Long> {
    DeviceEntity findByDeviceId(String dId);
}