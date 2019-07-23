package com.lmx.pushplatform.gateway.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 群组
 */
@Entity
@Table(name = "t_group")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"userEntity","groupMembersEntitySet"})
public class GroupEntity implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String groupName;
    private String userId;//群主
    private int state;
    private Date createTime, updateTime;
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false, updatable = false, insertable = false)
    private UserEntity userEntity;

    @OneToMany(targetEntity = GroupMembersEntity.class, cascade = CascadeType.ALL,
            mappedBy = "groupEntity")
    private Set<GroupMembersEntity> groupMembersEntitySet;
}
