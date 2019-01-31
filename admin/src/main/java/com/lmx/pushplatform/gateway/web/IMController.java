package com.lmx.pushplatform.gateway.web;

import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.GroupIMReq;
import com.lmx.pushplatform.gateway.api.P2pIMReq;
import com.lmx.pushplatform.gateway.common.CommonService;
import com.lmx.pushplatform.proto.PushRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/im")
public class IMController {
    @Autowired
    private ClientDelegate clientDelegate;
    @Autowired
    private CommonService commonService;

    /**
     * 点对点聊天
     *
     * @param p2pIMReq
     * @return
     */
    @PostMapping("/p2p/push")
    public CommonResp p2pPush(@RequestBody P2pIMReq p2pIMReq) {
        PushRequest pushRequest = new PushRequest();
        pushRequest.setMsgContent(p2pIMReq.getMsgContent());
        pushRequest.setPlatform(p2pIMReq.getPlatform());
        pushRequest.setFromId(p2pIMReq.getFromUserId());
        //1个id=单发；多个id=群发
        pushRequest.setToId(p2pIMReq.getToUserIds());
        clientDelegate.sendOnly(pushRequest);
        return CommonResp.builder().code("0000").build();
    }

    /**
     * 群组聊天
     *
     * @param groupIMReq
     * @return
     */
    @PostMapping("/group/push")
    public CommonResp groupPush(@RequestBody GroupIMReq groupIMReq) {
        PushRequest pushRequest = new PushRequest();
        pushRequest.setMsgContent(groupIMReq.getMsgContent());
        pushRequest.setPlatform(groupIMReq.getPlatform());
        pushRequest.setFromId(groupIMReq.getFromUserId());
        //推送给当前群组的全部成员
        pushRequest.setToId(Lists.newArrayList(commonService.getGroupMembersById(groupIMReq.getGroupId())));
        clientDelegate.sendOnly(pushRequest);
        return CommonResp.builder().code("0000").build();
    }
}
