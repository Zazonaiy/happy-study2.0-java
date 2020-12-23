package com.happystudy2.happystudy2management;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.happystudy2.happystudy2management"})
@MapperScan(basePackages = {"com.happystudy2.happystudy2management.dao"})
public class HappyStudy2ManagementApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder){
        return builder.sources(HappyStudy2ManagementApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(HappyStudy2ManagementApplication.class, args);
    }

}
