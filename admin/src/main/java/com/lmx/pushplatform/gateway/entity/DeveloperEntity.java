package com.lmx.pushplatform.gateway.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "t_developer")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"appEntitySet"})
public class DeveloperEntity implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String developer;
    private String password;
    private int state;
    private Date createTime, updateTime;
    @JsonIgnore
    @OneToMany(targetEntity = AppEntity.class, cascade = CascadeType.ALL,
            mappedBy = "developerEntity")
    private Set<AppEntity> appEntitySet;
}
