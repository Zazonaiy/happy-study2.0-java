package com.happystudy2.happystudy2management.loginCenter;

import org.apache.shiro.authc.*;
import org.apache.shiro.realm.Realm;

/**
 * 微笑账号密码角色 数据源
 */
public class WxNumRealm implements Realm {

    @Override
    public String getName(){
        return "wxnum-password Realm by happy-study2.0";
    }

    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof UsernamePasswordToken;
    }

    @Override
    public AuthenticationInfo getAuthenticationInfo (AuthenticationToken token) throws AuthenticationException {
        String wxnum = (String) token.getPrincipal();
        String wxpassword = new String((char[])token.getCredentials());

        //TODO 具体判断逻辑
        if ("".equals(wxnum)){
            throw new UnknownAccountException();//如果微信号登录失败错误
        }

        //如果省份验证成功，返回一个AuthenticationInfo实现
        return new SimpleAuthenticationInfo(wxnum, wxpassword, getName());
    }
}
