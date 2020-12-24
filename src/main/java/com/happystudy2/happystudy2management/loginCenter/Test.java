package com.happystudy2.happystudy2management.loginCenter;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Test {
    private static final transient Logger log = LoggerFactory.getLogger(Test.class);

    public static void main(String[] args){
        Factory<org.apache.shiro.mgt.SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-jdbc-realm.ini");

        org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken("admin", "111");
        try{
            subject.login(token);
            System.out.println("登录成功!");
        }catch (AuthenticationException e){
            System.out.println("登录失败！");
            System.out.println(token.toString());
        }

        Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已登录
        subject.logout();
    }


}
