package com.happystudy2.happystudy2management.loginCenter;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

public class TestMatcher extends SimpleCredentialsMatcher {
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken uToken = (UsernamePasswordToken)token;
        //后台传入的密码
        String password  =  new String(uToken.getPassword());
        //获取数据库存放的的密码
        //String dbPassword = (String) info.getCredentials();
        String dbPassword = new String((char[])info.getCredentials());
        //String dbPassword = info.getCredentials().toString();
        return this.equals(password,dbPassword);
    }

}
