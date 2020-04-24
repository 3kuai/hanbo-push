package com.lmx.pushplatform.gateway.api;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by limingxin on 2017/7/5.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommonResp<T> {
    String code = "0000";
    String msg = "成功";
    T data;
    int draw, recordsTotal, recordsFiltered;

    public CommonResp(T data) {
        this.data = data;
    }

    public static CommonResp defaultSuccess() {
        return new CommonResp();
    }

    public static CommonResp defaultSuccess(Object data) {
        return new CommonResp(data);
    }

    public static CommonResp defaultError(String error) {
        return CommonResp.builder().code("9991").msg(error).build();
    }

    public static CommonResp defaultError(String code, String error) {
        return CommonResp.builder().code(code).msg(error).build();
    }
}
