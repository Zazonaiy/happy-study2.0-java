package com.happystudy2.happystudy2management.loginCenter;

import com.happystudy2.happystudy2management.core.domain.vo.LoginParam;
import com.happystudy2.happystudy2management.core.service.PasswordHelper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.Factory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Authenticator {
    private static final transient Logger log = LoggerFactory.getLogger(Authenticator.class);
    private Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-jdbc-realm.ini");
    @Autowired
    private PasswordHelper passwordHelper;

    public LoginParam login(String username, String password){
        //TODO: 1 通过jdbc,获取SecurityManager工厂
        //Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-jdbc-realm.ini");

        //TODO: 2 得到SecurityManager实例并绑定给SecurityUtils
        org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);

        //TODO: 3 得到Subject及创建用户名/密码身份验证Token（用户身份/凭证）
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        LoginParam resData = LoginParam.builder().build();
        //TODO 4 身份验证
        try{
            currentUser.login(token);
            boolean hasRole = currentUser.hasRole("xxRole");
            boolean isPermitted = currentUser.isPermitted("y/n");
            //TODO: 验证成功
            log.info(hasRole+"-----"+isPermitted);
            log.info("身份验证成功");

            resData.setDescription(hasRole+"-----"+isPermitted+" 身份验证成功");
            resData.setSuccess(true);
        } catch(UnknownAccountException uae){
            resData.setDescription("没有该用户: "+token.getUsername());
            resData.setSuccess(false);
            log.info("没有该用户: "+token.getPrincipal());
        } catch (IncorrectCredentialsException ice){
            resData.setDescription(token.getPrincipal() + " 的密码错误");
            resData.setSuccess(false);
            log.info(token.getPrincipal() + " 的密码错误");
        } catch (LockedAccountException lea){
            resData.setDescription(token.getPrincipal() + " 被锁定，请联系管理员");
            resData.setSuccess(false);
            log.info(token.getPrincipal() + " 被锁定，请联系管理员");
        } catch (AuthenticationException e){
            resData.setDescription("身份验证失败 系统异常");
            resData.setSuccess(false);
            e.printStackTrace();
            log.info("身份验证失败 ——未知异常");

        }

        if (currentUser.isAuthenticated()){
            if (resData.getSuccess()){
                log.info("用户: " + currentUser.getPrincipal() + " 登录成功!");
                resData.setCurrentUser(currentUser);
            }

        }

        //TODO: 得到一个身份集合,用于多realm
        PrincipalCollection principalCollection = currentUser.getPrincipals();

        return resData;
    }
}
