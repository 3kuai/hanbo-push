package com.lmx.pushplatform.gateway.filter;

import com.google.common.base.Charsets;
import com.lmx.pushplatform.gateway.dao.DeveloperRep;
import com.lmx.pushplatform.gateway.entity.DeveloperEntity;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.data.redis.core.RedisTemplate;

import javax.servlet.*;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Administrator on 2018/11/24.
 */
public class LoginFilter implements Filter {
    private RedisTemplate redisTemplate;

    private DeveloperRep developerRep;
    private final static String ERROR_MSG = "{\"code\":\"9995\",\"message\":\"您还未登录呢，请操作一下吧\"}";

    public LoginFilter(DeveloperRep developerRep, RedisTemplate redisTemplate) {
        this.developerRep = developerRep;
        this.redisTemplate = redisTemplate;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String userId = httpServletRequest.getHeader("token");
        if (userId != null) {
            Long tk = (Long) redisTemplate.opsForValue().get(userId);
            DeveloperEntity developerEntity = developerRep.findOne(tk);
            if (developerEntity == null) {
                try (OutputStream os = response.getOutputStream()) {
                    os.write(ERROR_MSG.getBytes(Charsets.UTF_8));
                    os.flush();
                    return;
                } catch (Exception e) {
                    throw e;
                }
            } else {
                chain.doFilter(request, response);
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
