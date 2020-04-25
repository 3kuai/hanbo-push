package com.lmx.pushplatform.gateway.dao;

import com.lmx.pushplatform.gateway.entity.MessageEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface MessageRep extends JpaRepository<MessageEntity, Long> {
    Page<MessageEntity> findByAppNameLikeOrMessageContentLikeOrMessageTitleLike(String a, String b, String c, Pageable pageable);

    List<MessageEntity> findByCreateTimeBetween(Date start, Date end);
}