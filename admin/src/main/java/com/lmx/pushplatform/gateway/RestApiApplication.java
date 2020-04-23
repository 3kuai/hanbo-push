package com.lmx.pushplatform.gateway;

import com.google.common.collect.Lists;
import com.lmx.pushplatform.client.DynamicConnector;
import com.lmx.pushplatform.gateway.dao.DeveloperRep;
import com.lmx.pushplatform.gateway.filter.LoginFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableScheduling
@EnableTransactionManagement
public class RestApiApplication {

    @Bean
    public DynamicConnector newClientDelegate() {
        return new DynamicConnector();
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
        filterRegistrationBean.setFilter(new LoginFilter(developerRep, redisTemplate));
        filterRegistrationBean.setUrlPatterns(Lists.newArrayList("/push/*"));
        filterRegistrationBean.setOrder(1);
        return filterRegistrationBean;
    }


    public static void main(String[] args) {
        System.setProperty("zk.hosts", "127.0.0.1:2181");
        SpringApplication.run(RestApiApplication.class, args);
    }
}
