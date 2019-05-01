package com.lmx.pushplatform.gateway.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.PushReq;
import com.lmx.pushplatform.gateway.dao.AppRep;
import com.lmx.pushplatform.gateway.dao.MessageRep;
import com.lmx.pushplatform.gateway.entity.AppEntity;
import com.lmx.pushplatform.gateway.entity.DeviceEntity;
import com.lmx.pushplatform.gateway.entity.MessageEntity;
import com.lmx.pushplatform.gateway.entity.UserEntity;
import com.lmx.pushplatform.proto.PushRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

@RestController
@RequestMapping("/push")
@Slf4j
public class PushController {
    @Autowired
    private DynamicConnector clientDelegate;
    @Autowired
    private AppRep appRep;
    @Autowired
    private MessageRep messageRep;


    /**
     * app发布IM消息，服务端程序调用
     *
     * @param pushReq
     * @return
     */
    @PostMapping("/server")
    public CommonResp push(@RequestBody PushReq pushReq) {
        //找到app设备下的所有注册用户
        AppEntity appEntity = appRep.findByAppName(pushReq.getAppName());
        Set<UserEntity> userEntities = appEntity.getUserEntitySet();
        Set<String> sets = Sets.newHashSet();
        for (UserEntity u : userEntities) {
            sets.add(String.valueOf(u.getId()));
        }
        if (CollectionUtils.isEmpty(sets))
            return CommonResp.defaultSuccess();
        PushRequest pushRequest = new PushRequest();
        pushRequest.setMsgType(1);
        pushRequest.setMsgContent(pushReq.getMessageContent());
        pushRequest.setToId(Lists.newArrayList(sets));
        pushRequest.setPlatform(pushReq.getPlatform());
        clientDelegate.sendOnly(pushRequest);
        return CommonResp.defaultSuccess();
    }

    /**
     * 后台发布app推送消息，管理页面调用
     *
     * @param pushReq
     * @return
     */
    @PostMapping("/admin")
    public CommonResp admin(@RequestBody PushReq pushReq) {
        //找到app设备下的所有设备号
        AppEntity appEntity = appRep.findByAppName(pushReq.getAppName());
        Set<DeviceEntity> deviceEntities = appEntity.getDeviceEntitySet();
        Set<String> sets = Sets.newHashSet();
        for (DeviceEntity u : deviceEntities) {
            sets.add(String.valueOf(u.getDeviceId()));
        }
        if (CollectionUtils.isEmpty(sets))
            return CommonResp.defaultSuccess("该appName下没有设备需要推送");
        PushRequest pushRequest = new PushRequest();
        pushRequest.setMsgType(PushRequest.MessageType.DILIVERY_MSG.ordinal());
        pushRequest.setMsgContent(pushReq.getMessageContent());
        pushRequest.setFromId("admin");
        pushRequest.setToId(Lists.newArrayList(sets));
        pushRequest.setPlatform(pushReq.getPlatform());
        pushRequest.setAppKey(pushReq.getAppName());
        messageRep.save(MessageEntity.builder()
                .appId(String.valueOf(appEntity.getId()))
                .appName(appEntity.getAppName())
                .messageTitle(pushReq.getMessageTitle())
                .messageContent(pushReq.getMessageContent())
                .platform(pushReq.getPlatform())
                .build());
        clientDelegate.sendOnly(pushRequest);
        log.info("admin push msg={}",pushRequest);
        return CommonResp.defaultSuccess();
    }

    @PostMapping("admin/list")
    public CommonResp list(@RequestBody PushReq pushReq) {
        return CommonResp.defaultSuccess(messageRep.findByAppName(pushReq.getAppName()));
    }
}
