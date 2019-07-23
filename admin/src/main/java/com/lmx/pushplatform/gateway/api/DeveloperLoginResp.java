package com.lmx.pushplatform.gateway.api;

import com.lmx.pushplatform.gateway.entity.AppEntity;
import lombok.Builder;
import lombok.Data;

import java.util.Set;

@Data
@Builder
public class DeveloperLoginResp {

    private String id;
    private Set<AppEntity> appEntitySet;
}
