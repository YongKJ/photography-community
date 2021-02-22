package com.web.graduation.config;

import com.web.graduation.component.TokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ConcurrentTaskExecutor;
import org.springframework.web.servlet.config.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;

@Configuration
public class CrossDomainConfigurer implements WebMvcConfigurer {

    @Autowired
    private TokenInterceptor tokenInterceptor;

    //构造方法
    public CrossDomainConfigurer(TokenInterceptor tokenInterceptor){
        this.tokenInterceptor = tokenInterceptor;
    }

    public void addCorsMappings(CorsRegistry registry){
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("GET","HEAD","POST","PUT","DELETE","OPTIONS")
                .allowCredentials(true)
                .maxAge(3600)
                .allowedHeaders("*");
    }

    @Override
    public void configureAsyncSupport(AsyncSupportConfigurer configurer){
        configurer.setTaskExecutor(new ConcurrentTaskExecutor(Executors.newFixedThreadPool(3)));
        configurer.setDefaultTimeout(30000);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        List<String> excludePath = new ArrayList<>();
        //排除拦截，除了注册登录发验证码(此时还没token)，其他都拦截
        excludePath.add("/user/sendmail");
        excludePath.add("/user/login");  //登录
        excludePath.add("/user/register"); //注册
        excludePath.add("/article/gentiles");//社区帖子
        excludePath.add("/article/search");//社区搜索
        excludePath.add("/article/gettable");//帖子详情
        excludePath.add("/article/glance");//浏览量
        excludePath.add("/article/garrot");//热文
        excludePath.add("/comment/info");//评论信息
        excludePath.add("/comment/work");
        excludePath.add("/works/gallery");
        excludePath.add("/works/glance");
        excludePath.add("/works/index");
        excludePath.add("/works/worklet");//作品信息
        excludePath.add("/static/**");  //静态资源
        excludePath.add("/templates/**");  //静态资源
        excludePath.add("/");  //静态资源

        registry.addInterceptor(tokenInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(excludePath);
        WebMvcConfigurer.super.addInterceptors(registry);
    }
}
