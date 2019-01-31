package com.lmx.pushplatform.gateway.filter;

import com.lmx.pushplatform.gateway.dao.AppRep;
import com.lmx.pushplatform.gateway.entity.AppEntity;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

import javax.servlet.*;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Administrator on 2018/11/24.
 */
public class AuthFilter implements Filter {

    private AppRep appRep;

    public AuthFilter(AppRep appRep) {
        this.appRep = appRep;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String appKey = httpServletRequest.getHeader("appKey");
        String appSecret = httpServletRequest.getHeader("appSecret");
        String appName = request.getParameter("appName");
        AppEntity appEntity = appRep.findAppEntityByAppNameAndAppKeyAndAppSecret(
                appName, appKey, appSecret);
        if (appEntity == null) {
            try (OutputStream os = response.getOutputStream();) {
                os.write("{\"code\":\"9990\",\"message\":\"您无权访问，请检查密钥\"}" .getBytes());
                os.flush();
                return;
            } catch (Exception e) {
                throw e;
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
