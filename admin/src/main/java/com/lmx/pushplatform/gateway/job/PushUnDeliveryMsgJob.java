package com.lmx.pushplatform.gateway.job;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.gateway.dao.DeviceMessageRep;
import com.lmx.pushplatform.gateway.dao.MessageRep;
import com.lmx.pushplatform.gateway.entity.DeviceMessageEntity;
import com.lmx.pushplatform.gateway.entity.MessageEntity;
import com.lmx.pushplatform.proto.PushRequest;
import com.lmx.pushplatform.proto.PushResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by lucas on 2020/4/23.
 */
@Component
@Slf4j
public class PushUnDeliveryMsgJob {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DynamicConnector clientDelegate;
    @Autowired
    private DeviceMessageRep deviceMessageRep;
    @Autowired
    private MessageRep messageRep;
    private final static String SQL = "SELECT tmp.message_title,tmp.message_content,tdm.device_id,tdm.app_name,tdm.id " +
            "FROM `t_device_message` tdm " +
            "inner join t_message_push tmp on tdm.message_id=tmp.id " +
            "where tdm.delivery_state=0;";

    @Scheduled(cron = "0 0/1 * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void handler() {
        log.info("定时发送推送消息开始");
        jdbcTemplate.query(SQL, (RowMapper<ImmutableMap>) (resultSet, i) -> ImmutableMap.of("messageTitle", resultSet.getString(1),
                "messageContent", resultSet.getString(2),
                "deviceId", resultSet.getString(3),
                "d_m_id", resultSet.getLong(5),
                "appName", resultSet.getString(4))).forEach(immutableMap -> {
            PushRequest pushRequest = new PushRequest();
            pushRequest.setMsgType(PushRequest.MessageType.DILIVERY_MSG.ordinal());
            pushRequest.setMsgContent((String) immutableMap.get("messageContent"));
            pushRequest.setFromId("admin");
            pushRequest.setToId(Lists.newArrayList((String) immutableMap.get("deviceId")));
            pushRequest.setAppKey((String) immutableMap.get("appName"));

            PushResponse pushResponse = clientDelegate.sendAndGet(pushRequest);
            log.info("推送消息，请求={} 应答={}", pushRequest, pushResponse);
            boolean ok = (boolean) Lists.newArrayList(pushResponse.getExtraData().get(0).values()).get(0);
            if (ok) {
                DeviceMessageEntity deviceMessageEntity = deviceMessageRep.findOne((Long) immutableMap.get("d_m_id"));
                deviceMessageEntity.setDeliveryState(1);
                deviceMessageEntity.setUpdateTime(new Date());
                deviceMessageRep.save(deviceMessageEntity);
                MessageEntity messageEntity = deviceMessageEntity.getMessageEntity();
                messageEntity.setSendSuccessCnt(messageEntity.getSendSuccessCnt() + 1);
                messageEntity.setSendFailCnt(messageEntity.getSendFailCnt() - 1);
                messageEntity.setUpdateTime(new Date());
                messageRep.save(messageEntity);
            }
        });
        log.info("定时发送推送消息结束");
    }
}
