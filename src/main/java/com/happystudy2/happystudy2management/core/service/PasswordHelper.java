package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

@Component
public class PasswordHelper {
    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
    public final static String ALGORITHM_NAME = "md5";
    public final static int HASH_ITERATIONS = 2;
    private String algorithmName = ALGORITHM_NAME;
    private int hashIterations = HASH_ITERATIONS;

    public UserPO encryptPassword(UserPO userPO){
        userPO.setPasswordSalt(randomNumberGenerator.nextBytes().toHex());
        //String encryptPassword = new SimpleHash(
        //        algorithmName,
        //        userPO.getPassword(),
        //        ByteSource.Util.bytes(userPO.getCredentialsSalt()),
        //        hashIterations).toHex();
        String encryptPassword = this.createCredentials(userPO.getPassword(), userPO.getPasswordSalt());
        userPO.setPassword(encryptPassword);
        return userPO;
    }

    public String genSalt(){
        return randomNumberGenerator.nextBytes().toHex();
    }

    public String createCredentials(String credentials, String salt){
        return new SimpleHash(
                algorithmName,
                credentials,
                salt,
                hashIterations
        ).toHex();
    }

    public boolean checkCredentials(String credentials, String salt, String encryptCredentials){
        return encryptCredentials.equals(createCredentials(credentials, salt));
    }
}
