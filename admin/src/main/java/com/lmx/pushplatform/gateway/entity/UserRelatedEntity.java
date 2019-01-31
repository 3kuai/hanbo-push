package com.lmx.pushplatform.gateway.entity;

import lombok.*;
import lombok.experimental.Builder;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "t_user_related")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"userEntity"})
public class UserRelatedEntity implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String userId;
    private String followUserId;
    private int followState;//=0未关注，1=已关注
    private int state;
    private Date createTime, updateTime;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false, updatable = false, insertable = false)
    private UserEntity userEntity;
}
