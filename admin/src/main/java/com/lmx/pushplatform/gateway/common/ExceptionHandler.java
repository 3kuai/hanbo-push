package com.lmx.pushplatform.gateway.common;

import com.lmx.pushplatform.gateway.api.CommonResp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/11/24.
 */
@ControllerAdvice
@Slf4j
public class ExceptionHandler {

    @org.springframework.web.bind.annotation.ExceptionHandler(Exception.class)
    @ResponseBody
    public CommonResp doException(Exception e) {
        log.error("", e);
        return CommonResp.defaultError(e.getMessage());
    }
}
