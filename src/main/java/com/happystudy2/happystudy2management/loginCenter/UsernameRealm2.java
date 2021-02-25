package com.happystudy2.happystudy2management.loginCenter;

import com.happystudy2.happystudy2management.core.service.PasswordHelper;
import com.happystudy2.happystudy2management.dao.user.UserMapper;
import com.happystudy2.happystudy2management.dao.user.view.RolePermissionViewMapper;
import com.happystudy2.happystudy2management.dao.user.view.UserPermissionViewMapper;
import com.happystudy2.happystudy2management.dao.user.view.UserRoleViewMapper;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import com.happystudy2.happystudy2management.domain.po.user.view.RolePermissionViewPO;
import com.happystudy2.happystudy2management.domain.po.user.view.UserRoleViewPO;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.naming.ConfigurationException;
import java.util.*;

public class UsernameRealm2 extends AuthorizingRealm {
    @Resource
    private UserMapper userMapper;
    @Resource
    private UserRoleViewMapper userRoleViewMapper;
    @Resource
    private UserPermissionViewMapper userPermissionViewMapper;
    @Resource
    private RolePermissionViewMapper rolePermissionViewMapper;
    @Resource
    private PasswordHelper passwordHelper;

    private static final Logger log = LoggerFactory.getLogger(UsernameRealm2.class);
    protected JdbcRealm.SaltStyle saltStyle;
    protected Boolean permissionsLookupEnabled = true;

    public UsernameRealm2(){
        //this.saltStyle = JdbcRealm.SaltStyle.NO_SALT;
        //TODO: 等从系统注册进用户了改用这个
        this.saltStyle = JdbcRealm.SaltStyle.COLUMN;
    }
    public void setSaltStyle(JdbcRealm.SaltStyle saltStyle){
        this.saltStyle = saltStyle;
        if (saltStyle == JdbcRealm.SaltStyle.COLUMN){
            //
        }
    }

    @Override
    public String getName(){
        return "username-password Realm by happy-study2.0";
    }

    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof UsernamePasswordToken;
    }

    /**
     * 用处 currentUser.login(token)
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    public AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException{
        String username = (String) token.getPrincipal();

        if (StringUtils.isBlank(username)){
            throw new AccountException("缺少username, 无法通过realm");
        }else{
            SimpleAuthenticationInfo info = null;

            String salt ;
            try{
                salt = null;
                String password = null;
                ByteSource credentialsSalt = null;
                switch (this.saltStyle){
                    case NO_SALT:
                        password = this.getPasswordAndSalt(username)[0];
                        break;
                    case CRYPT:
                        throw new ConfigurationException("暂不支持 CRYPT盐");
                    case COLUMN:
                        UserPO select = this.getUser(username);
                        password = select.getPassword();
                        salt = select.getPasswordSalt();
                        if (Objects.nonNull(salt)){
                            //credentialsSalt = ByteSource.Util.bytes(select.getCredentialsSalt());
                            credentialsSalt = ByteSource.Util.bytes(salt);
                        }
                        break;
                    case EXTERNAL:
                        password = this.getPasswordAndSalt(username)[0];
                        salt = this.getSaltForUser(username);
                        credentialsSalt = ByteSource.Util.bytes(salt);
                }
                if (StringUtils.isBlank(password)){
                    throw new UnknownAccountException("No account found for user [" + username + "] 密码或盐验证失败");
                }

                info = new SimpleAuthenticationInfo(username, password.toCharArray(), this.getName()); //password.toCharArray()
                if (Objects.nonNull(credentialsSalt)){
                    //info.setCredentialsSalt(ByteSource.Util.bytes(salt));
                    info.setCredentialsSalt(credentialsSalt);
                    //info.getCredentialsSalt();
                }
            } catch (ConfigurationException sqle) {
                //sqle.printStackTrace();
                salt = "there was a SQL error while authenticating user [" + username + "]";
                if (log.isErrorEnabled()){
                    log.error(salt, sqle);
                }

                throw new AuthenticationException(salt, sqle);
            }

            return info;
        }
    }

    /**
     * 用处 subject.hasRole("xxx"); subject.isPermitted("xxx"); @RequiresRoles("admin")加在方法上时
     * @param principals
     * @return
     */
    @Override
    public AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        if (Objects.isNull(principals)){
            throw new AuthorizationException("PrincipalCollection method argument cannot be null");
        }else {
            //获取验证凭证（当前只支持账号）
            String username = (String) this.getAvailablePrincipal(principals);
            Set<String> roleNames = null;
            Set<String> permissions = null;

            roleNames = this.getRoleNameSet(username);
            if (this.permissionsLookupEnabled){
                permissions = this.getPermissionNameSet(roleNames);
            }

            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
            info.setStringPermissions(permissions);
            return info;
        }
    }


    /**
     *
     * @param username
     * @return result[0]password result[1]salt
     */
    private String[] getPasswordAndSalt(String username){
        boolean returningSeparatedSalt = false;
        String[] result;
        //String[] result = new String[2];
        //returningSeparatedSalt = true;
        switch (this.saltStyle){
            case NO_SALT:
            case CRYPT:
            case COLUMN:
                result = new String[2];
                returningSeparatedSalt = true;
                break;
            case EXTERNAL:
                result = new String[1];
                break;
            default:
                result = new String[2];
                returningSeparatedSalt = true;
        }
        UserPO userPO = this.getUser(username);
        String password = Objects.isNull(userPO) ? null : userPO.getPassword();
        result[0] = password;
        if (returningSeparatedSalt){
            result[1] = userPO.getPasswordSalt();
        }
        return result;
    }

    private UserPO getUser(String username){
        Example example = new Example(UserPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted" ,false);
        criteria.andEqualTo("username", username);

        return userMapper.selectOneByExample(example);
    }

    private Set<String> getRoleNameSet(String username){
        LinkedHashSet roleNames = new LinkedHashSet();

        Example example = new Example(UserRoleViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("username", username);

        List<UserRoleViewPO> userRoleViewPOList = userRoleViewMapper.selectByExample(example);
        if (!userRoleViewPOList.isEmpty()){
            for (UserRoleViewPO userRoleViewPO : userRoleViewPOList){
                String roleName = userRoleViewPO.getRoleName();
                roleNames.add(roleName);
            }
        }else{
            log.warn("该用户没有找到它的角色 [" + username + "]");
        }
        return roleNames;
    }

    private Set<String> getPermissionNameSet(String roleName){
        LinkedHashSet permissionNames = new LinkedHashSet();

        Example example = new Example(RolePermissionViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("roleName", roleName);

        List<RolePermissionViewPO> rolePermissionViewPOList = rolePermissionViewMapper.selectByExample(example);
        if (!rolePermissionViewPOList.isEmpty()){
            for (RolePermissionViewPO rolePermissionViewPO : rolePermissionViewPOList){
                String permissionName = rolePermissionViewPO.getPermissionName();
                permissionNames.add(permissionName);
            }
        }else{
            log.warn("该角色不存在任何权限 [" + roleName + "]");
        }
        return permissionNames;
    }

    private Set<String> getPermissionNameSet(Collection<String> roleNames){
        Set<String> permissions = new LinkedHashSet<>();
        Iterator roleNames$ = roleNames.iterator();

        while (roleNames$.hasNext()){
            String roleName = (String) roleNames$.next();
            Set<String> permissionsOfSomeRole = this.getPermissionNameSet(roleName);

            Iterator permission$ = permissionsOfSomeRole.iterator();
            while (permission$.hasNext()){
                String permissionName = (String) permission$.next();
                permissions.add(permissionName);
            }
        }
        return permissions;
    }
    private String getSaltForUser(String username){
        return username;
    }

}
