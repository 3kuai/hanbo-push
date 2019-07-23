package com.lmx.pushplatform.gateway.web;

import com.lmx.pushplatform.client.Connector;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.MobileRegReq;
import com.lmx.pushplatform.gateway.api.MobileRegResp;
import com.lmx.pushplatform.gateway.dao.AppRep;
import com.lmx.pushplatform.gateway.entity.AppEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AppRep appRep;
    @Autowired
    private DynamicConnector clientDelegate;
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 注册app
     *
     * @param mobileRegReq
     * @return
     */
    @PostMapping("/reg")
    public CommonResp reg(@RequestBody MobileRegReq mobileRegReq, @RequestHeader String token) {
        AppEntity appEntity = AppEntity.builder()
                .developerId(String.valueOf(redisTemplate.opsForValue().get(token)))
                .appName(mobileRegReq.getAppName())
                .appKey(UUID.randomUUID().toString().replaceAll("-", ""))
                .appSecret(UUID.randomUUID().toString().replaceAll("-", "").substring(10, 20).toLowerCase())
                .build();
        appRep.save(appEntity);
        return CommonResp.defaultSuccess(MobileRegResp.builder()
                .appId(appEntity.getId())
                .appKey(appEntity.getAppKey())
                .appName(appEntity.getAppName())
                .appSecret(appEntity.getAppSecret())
                .build());
    }

    /**
     * app鉴权
     *
     * <p>鉴权通过后随机返回一路有效的连接地址</p>
     *
     * @param mobileRegReq
     * @return
     */
    @PostMapping("/auth")
    public CommonResp auth(@RequestBody MobileRegReq mobileRegReq) {
        AppEntity appEntity = appRep.findAppEntityByAppNameAndAppKeyAndAppSecret(
                mobileRegReq.getAppName(), mobileRegReq.getAppKey(), mobileRegReq.getAppSecret());
        if (appEntity == null) {
            return CommonResp.defaultError("9996", "您无权访问，请检查密钥");
        }
        Connector connector = clientDelegate.getClient(mobileRegReq.getRemoteIp());
        if (connector == null) {
            return CommonResp.defaultError("9997", "无可用连接");
        }
        return CommonResp.defaultSuccess(connector.toString());
    }
}
