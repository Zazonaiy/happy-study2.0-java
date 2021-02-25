package com.happystudy2.happystudy2management.config;

import com.happystudy2.happystudy2management.constants.configData.ConfigDataMap;
import com.happystudy2.happystudy2management.interceptor.CtxPathInterceptor;
import com.happystudy2.happystudy2management.interceptor.user.UserInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class HappyStudyConfig implements WebMvcConfigurer {
    @Autowired
    private CtxPathInterceptor ctxPathInterceptor;
    @Autowired
    private UserInterceptor userInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(ctxPathInterceptor).addPathPatterns("/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/happy-study/**");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("fileupload/**").addResourceLocations(ConfigDataMap.FILE_UPLOAD_PATH);
    }
}
