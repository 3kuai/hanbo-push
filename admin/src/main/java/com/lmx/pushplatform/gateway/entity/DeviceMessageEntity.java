package com.lmx.pushplatform.gateway.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_device_message")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"deviceEntity", "messageEntity"})
public class DeviceMessageEntity {
    @Id
    @GeneratedValue
    private long id;
    private long appId, messageId;
    private String appName, deviceId;
    /*deliveryState 投递状态 1=投递成功，0=未投递*/
    private int deliveryState, readState;
    private Date createTime, updateTime;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "deviceId", referencedColumnName = "deviceId", nullable = false, updatable = false, insertable = false)
    private DeviceEntity deviceEntity;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "messageId", nullable = false, updatable = false, insertable = false)
    private MessageEntity messageEntity;
}
