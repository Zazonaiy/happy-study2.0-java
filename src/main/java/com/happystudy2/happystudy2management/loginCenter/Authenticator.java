package com.happystudy2.happystudy2management.loginCenter;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

public class Authenticator {

    private void login(){
        //TODO: 1 通过jdbc,获取SecurityManager工厂
        Factory<SecurityManager> factory = new IniSecurityManagerFactory();

        //TODO: 2 得到SecurityManager实例并绑定给SecurityUtils
        org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);

        //TODO: 3 得到Subject及创建用户名/密码身份验证Token（用户身份/凭证）
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken("username", "password");

        //TODO 4 身份验证
        try{
            currentUser.login(token);
            boolean hasRole = currentUser.hasRole("xxRole");
            boolean isPermitted = currentUser.isPermitted("y/n");
            //TODO: 验证成功
            System.out.println(hasRole+"-----"+isPermitted);
            System.out.println("身份验证成功");
        } catch (AuthenticationException e){
            e.printStackTrace();
            System.out.println("身份验证失败");

        }
    }
}
