package com.lmx.pushplatform.gateway.web;

import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.DeveloperLoginResp;
import com.lmx.pushplatform.gateway.api.DeveloperRegReq;
import com.lmx.pushplatform.gateway.dao.DeveloperRep;
import com.lmx.pushplatform.gateway.entity.DeveloperEntity;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/developer")
public class DeveloperController {
    @Autowired
    private DeveloperRep developerRep;
    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("/reg")
    public CommonResp reg(@RequestBody DeveloperRegReq developerReq) {
        developerRep.save(DeveloperEntity.builder()
                .developer(developerReq.getUserName())
                .password(developerReq.getPassword())
                .build());
        DeveloperEntity developerEntity = developerRep.findByDeveloperAndPassword(
                developerReq.getUserName(), developerReq.getPassword());
        //注册成功自动登录
        String tk = UUID.randomUUID().toString().replaceAll("-", "");
        redisTemplate.opsForValue().set(tk, developerEntity.getId());
        return CommonResp.defaultSuccess(DeveloperLoginResp.builder()
                .id(tk)
                .build());
    }

    @PostMapping("/login")
    public CommonResp login(@RequestBody DeveloperRegReq developerReq, HttpServletRequest httpServletRequest) {
        DeveloperEntity developerEntity = developerRep.findByDeveloperAndPassword(
                developerReq.getUserName(), developerReq.getPassword());
        if (developerEntity == null)
            return CommonResp.defaultError("9993", "用户名或密码错误");
        else {
            String tk = UUID.randomUUID().toString().replaceAll("-", "");
            redisTemplate.opsForValue().set(tk, developerEntity.getId());
            return CommonResp.defaultSuccess(DeveloperLoginResp.builder()
                    .id(tk)
                    .appEntitySet(developerEntity.getAppEntitySet())
                    .build());
        }
    }


    @PostMapping("list")
    public CommonResp list(@RequestHeader String token) {
        Long id = (Long) redisTemplate.opsForValue().get(token);
        DeveloperEntity developerEntity = developerRep.findOne(id);
        return CommonResp.defaultSuccess(developerEntity.getAppEntitySet());
    }
}
