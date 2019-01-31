package com.lmx.pushplatform.gateway.web;

import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.DeviceRegReq;
import com.lmx.pushplatform.gateway.dao.DeviceRep;
import com.lmx.pushplatform.gateway.entity.DeviceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/device")
public class DeviceController {

    @Autowired
    private DeviceRep deviceRep;
    @Autowired
    private ClientDelegate clientDelegate;

    /**
     * 注册设备
     * <p>
     * 鉴权通过后调用
     * </p>
     *
     * @param deviceRegReq
     * @return
     */
    @PostMapping("/reg")
    public CommonResp reg(@RequestBody DeviceRegReq deviceRegReq) {
        deviceRep.save(DeviceEntity.builder()
                .appId(deviceRegReq.getAppId())
                .deviceId(deviceRegReq.getDeviceId())
                .state(deviceRegReq.getType())
                .platform(deviceRegReq.getPlatform())
                .build());
        return CommonResp.defaultSuccess();
    }

    /**
     * 解绑设备
     * <p>
     *     卸载app调用
     * </p>
     * @param deviceRegReq
     * @return
     */
    @PostMapping("/unreg")
    public CommonResp unreg(@RequestBody DeviceRegReq deviceRegReq) {
        DeviceEntity deviceEntity = deviceRep.findByDeviceId(deviceRegReq.getDeviceId());
        deviceEntity.setState(2);
        deviceRep.save(deviceEntity);
        return CommonResp.defaultSuccess();
    }

}
