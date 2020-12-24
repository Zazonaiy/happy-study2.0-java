package com.happystudy2.happystudy2management.loginCenter;

import org.apache.shiro.authc.*;
import org.apache.shiro.realm.Realm;

/**
 * 手机短信登录 数据源
 */
public class PhoneNumRealm implements Realm {

    @Override
    public String getName(){
        return "username-password Realm by happy-study2.0";
    }

    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof UsernamePasswordToken;
    }

    @Override
    public AuthenticationInfo getAuthenticationInfo (AuthenticationToken token) throws AuthenticationException {
        String phonenum = (String) token.getPrincipal();
        String verificationCode = new String((char[])token.getCredentials());

        //TODO 具体判断逻辑
        if ("".equals(phonenum)){
            throw new UnknownAccountException();//如果手机号码
        }
        if ("".equals(verificationCode)){
            throw new UnknownAccountException();//如果短信验证码
        }
        //如果省份验证成功，返回一个AuthenticationInfo实现
        return new SimpleAuthenticationInfo(phonenum, verificationCode, getName());
    }
}
