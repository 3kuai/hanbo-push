package com.lmx.pushplatform.gateway.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.context.annotation.Lazy;

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
    private String appId, appName, remark;
    private int pushState;//0=init, 1=success
    private int totalCnt;//设备总数
    private int sendSuccessCnt;//消息送达数=在线设备数
    private int sendFailCnt;//消息未送达数=离线设备数
    private int state;
    private Date createTime, updateTime;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "appId", nullable = false, updatable = false, insertable = false)
    @Lazy
    private AppEntity appEntity;
}
