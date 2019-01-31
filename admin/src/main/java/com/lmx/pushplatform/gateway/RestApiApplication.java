package com.lmx.pushplatform.gateway;

import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.ClientDelegate;
import com.lmx.pushplatform.gateway.dao.AppRep;
import com.lmx.pushplatform.gateway.dao.DeveloperRep;
import com.lmx.pushplatform.gateway.filter.LoginFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootApplication
public class RestApiApplication {

    @Bean
    public ClientDelegate newClientDelegate() {
        return new ClientDelegate();
    }

//    @Bean
//    public FilterRegistrationBean newAuthFilter(AppRep appRep) {
//        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
//        filterRegistrationBean.setFilter(new AuthFilter(appRep));
//        filterRegistrationBean.setUrlPatterns(Lists.newArrayList("/push/*",
//                "/user/*", "/group/*", "/im/*"));
//        filterRegistrationBean.setOrder(2);
//        return filterRegistrationBean;
//    }

    @Bean
    public FilterRegistrationBean newLoginFilter(DeveloperRep developerRep, RedisTemplate redisTemplate) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new LoginFilter(developerRep,redisTemplate));
        filterRegistrationBean.setUrlPatterns(Lists.newArrayList("/push/*"));
        filterRegistrationBean.setOrder(1);
        return filterRegistrationBean;
    }


    public static void main(String[] args) {
        SpringApplication.run(RestApiApplication.class, args);
    }
}
