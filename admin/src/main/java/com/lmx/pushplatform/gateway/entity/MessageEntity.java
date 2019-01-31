package com.lmx.pushplatform.gateway.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import lombok.experimental.Builder;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_message_push")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"appEntity"})
public class MessageEntity {
    @Id
    @GeneratedValue
    private long id;
    private String messageTitle;
    private String messageContent;
    private String messageUrl;
    private int platform = 1;//默认1=安卓，2=ios，0=全平台
    private String appId,appName;
    private int pushState;//0=init, 1=success
    private int state;
    private Date createTime, updateTime;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "appId", nullable = false, updatable = false, insertable = false)
    private AppEntity appEntity;
}
