package com.lmx.pushplatform.gateway.entity;

import lombok.*;
import lombok.experimental.Builder;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 群成员
 */
@Entity
@Table(name = "t_group_member")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"groupEntity"})
public class GroupMembersEntity implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String groupId;
    private String userId;
    private int state;
    private Date createTime, updateTime;
    @ManyToOne
    @JoinColumn(name = "groupId", nullable = false, updatable = false, insertable = false)
    private GroupEntity groupEntity;

}
