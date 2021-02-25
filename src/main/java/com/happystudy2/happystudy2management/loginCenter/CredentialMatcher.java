package com.happystudy2.happystudy2management.loginCenter;

import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.service.PasswordHelper;
import com.happystudy2.happystudy2management.dao.user.UserMapper;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.Objects;

public class CredentialMatcher extends SimpleCredentialsMatcher {
    @Resource
    private PasswordHelper passwordHelper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info){
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String username = (String) token.getPrincipal();
        String password = new String(usernamePasswordToken.getPassword());
        String dbPassword = new String((char[])info.getCredentials());

        String salt = this.getSaltFromDb(username);
        String hexPass = passwordHelper.createCredentials(password, salt);
        return this.equals(hexPass, dbPassword);

    }

    private String getSaltFromDb(String username){
        Example example = new Example(UserPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("username", username);
        UserPO userPO = userMapper.selectOneByExample(example);
        if (Objects.isNull(userPO)){
            throw new BussinessExcecption(BussinessErrorCodeEnum.LOSE_USER);
        }
        return userPO.getPasswordSalt();
    }

}
