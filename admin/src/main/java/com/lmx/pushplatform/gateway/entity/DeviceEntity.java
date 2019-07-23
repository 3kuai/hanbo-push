package com.lmx.pushplatform.gateway.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "t_device")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "appEntity")
public class DeviceEntity implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String deviceId;
    private String appId;
    private int platform;
    private int state;
    private Date createTime, updateTime;
    @ManyToOne
    @JoinColumn(name = "appId", nullable = false, updatable = false, insertable = false)
    private AppEntity appEntity;
}
