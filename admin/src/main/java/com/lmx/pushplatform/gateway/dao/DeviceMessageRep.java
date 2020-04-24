package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.DeviceMessageEntity;
import com.lmx.pushplatform.gateway.entity.MessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeviceMessageRep extends JpaRepository<DeviceMessageEntity, Long> {
    List<DeviceMessageEntity> findByAppName(String a);

    List<MessageEntity> findByAppNameLikeOrDeliveryStateOrReadState(String a, String b, String c);
}