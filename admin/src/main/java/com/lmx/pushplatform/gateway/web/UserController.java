package com.lmx.pushplatform.gateway.web;

import com.google.common.collect.Sets;
import com.lmx.pushplatform.gateway.api.CommonResp;
import com.lmx.pushplatform.gateway.api.UserFollowRegReq;
import com.lmx.pushplatform.gateway.api.UserRegReq;
import com.lmx.pushplatform.gateway.dao.UserRelatedRep;
import com.lmx.pushplatform.gateway.dao.UserRep;
import com.lmx.pushplatform.gateway.entity.UserEntity;
import com.lmx.pushplatform.gateway.entity.UserRelatedEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRep userRep;
    @Autowired
    private UserRelatedRep userRelatedRep;

    /**
     * 注册
     *
     * @param userRegReq
     * @return
     */
    @PostMapping("/reg")
    public CommonResp reg(@RequestBody UserRegReq userRegReq) {
        userRep.save(UserEntity.builder()
                .userName(userRegReq.getUserName())
                .appId(userRegReq.getAppId())
                .build());
        return CommonResp.defaultSuccess();
    }

    /**
     * 加、解除好友
     *
     * @param userFollowRegReq
     * @return
     */
    @PostMapping("/follow")
    public CommonResp follow(@RequestBody UserFollowRegReq userFollowRegReq) {
        userRelatedRep.save(UserRelatedEntity.builder()
                .userId(userFollowRegReq.getUserId())
                .followUserId(userFollowRegReq.getUserFollowId())
                .followState(userFollowRegReq.getState())
                .build());
        return CommonResp.defaultSuccess();
    }

    /**
     * 好友列表
     *
     * @param userFollowRegReq
     * @return
     */
    @PostMapping("/followList")
    public CommonResp followList(@RequestBody UserFollowRegReq userFollowRegReq) {
        UserEntity userEntity = userRep.findOne(Long.parseLong(userFollowRegReq.getUserId()));
        Set<UserRelatedEntity> userRelatedEntities = userEntity.getUserRelatedEntitySet();
        Set<String> sets = Sets.newHashSet();
        for (UserRelatedEntity u : userRelatedEntities) {
            sets.add(u.getFollowUserId());
        }
        return CommonResp.defaultSuccess(sets);
    }
}
