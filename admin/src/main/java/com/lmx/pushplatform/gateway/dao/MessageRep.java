package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.MessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MessageRep extends JpaRepository<MessageEntity, Long> {
    List<MessageEntity> findByAppName(String a);
}