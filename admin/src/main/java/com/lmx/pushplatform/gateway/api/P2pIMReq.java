package com.lmx.pushplatform.gateway.api;

import lombok.Data;

import java.util.List;

@Data
public class P2pIMReq extends IMReq {

    private List toUserIds;
}
