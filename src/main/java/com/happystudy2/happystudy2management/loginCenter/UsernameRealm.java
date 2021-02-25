package com.happystudy2.happystudy2management.loginCenter;

import com.happystudy2.happystudy2management.dao.user.UserMapper;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.JdbcUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import javax.naming.ConfigurationException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import org.apache.shiro.realm.AuthorizingRealm;

/**
 * 账号密码角色 数据源
 */
@Deprecated
public class UsernameRealm extends AuthorizingRealm {
    @Resource
    private UserMapper userMapper;
    protected static final String DEFAULT_AUTHENTICATION_QUERY = "select password from users where username = ?";
    protected static final String DEFALUT_SALTED_AUTHENTICATION_QUERY = "select password, password_salt from users where username = ?";
    protected static final String DEFAULT_USER_ROLES_QUERY = "select role_name from user_roles where username = ?";
    protected static final String DEFAULT_PERMISSIONS_QUERY = "select permission from roles_permissions where role_name = ?";
    private String authenticationQuery = UsernameRealm.DEFAULT_AUTHENTICATION_QUERY;
    private String saltedAuthenticationQuery = UsernameRealm.DEFALUT_SALTED_AUTHENTICATION_QUERY;
    private String userRolesQuery = UsernameRealm.DEFAULT_USER_ROLES_QUERY;
    private String permissionsQuery = UsernameRealm.DEFAULT_PERMISSIONS_QUERY;

    private static final Logger log = LoggerFactory.getLogger(UsernameRealm.class);
    protected DataSource dataSource;
    protected JdbcRealm.SaltStyle saltStyle;
    protected Boolean permissionsLookupEnabled = true;


    //TODO : https://www.cnblogs.com/blogxiao/archive/2004/01/13/8509433.html

    public UsernameRealm(){
        this.saltStyle = JdbcRealm.SaltStyle.NO_SALT;
    }

    public void setDataSource(DataSource dataSource){
        this.dataSource = dataSource;
    }
    public void setAuthenticationQuery(String query){
        this.authenticationQuery = query;
    }
    public void setUserRolesQuery(String query){
        this.userRolesQuery = query;
    }
    public void setPermissionsQuery(String query){
        this.permissionsQuery = query;
    }
    public void setSaltStyle(JdbcRealm.SaltStyle saltStyle){
        this.saltStyle = saltStyle;
        if (saltStyle == JdbcRealm.SaltStyle.COLUMN && this.authenticationQuery.equalsIgnoreCase("select password from users where username=?")){
            this.authenticationQuery = "select password, password_salt from users where username = ?";
        }
    }
    public void setPermissionsLookupEnabled(Boolean permissionsLookupEnabled){
        this.permissionsQuery = permissionsQuery;
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
    public AuthenticationInfo doGetAuthenticationInfo (AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        //String password = new String((char[])token.getCredentials());
        if (username == null){
            throw new AccountException("Null username, not allowed by this realm");
        }else{
            Connection conn = null;
            SimpleAuthenticationInfo info = null;

            try{
                String salt;
                try{
                    conn = this.dataSource.getConnection();
                    salt = null;
                    String password = null;
                    switch (this.saltStyle){
                        case NO_SALT:
                            password = this.getPasswordForUser(conn, username)[0];
                            break;
                        case CRYPT:
                            throw new ConfigurationException("Not implemented yet");
                        case COLUMN:
                            String[] queryResult = this.getPasswordForUser(conn, username);
                            password = queryResult[0];
                            salt = queryResult[1];
                            break;
                        case EXTERNAL:
                            password = this.getPasswordForUser(conn, username)[0];
                            salt = this.getSaltForUser(username);
                    }
                    if (password == null){
                        throw new UnknownAccountException("No account found for user [" + username + "] 密码或盐验证失败");
                    }

                    info = new SimpleAuthenticationInfo(username, password.toCharArray(), this.getName());
                    if (salt != null){
                        info.setCredentialsSalt(ByteSource.Util.bytes(salt));
                    }
                } catch (SQLException | ConfigurationException sqle){
                    salt = "there was a SQL error while authenticating user [" + username + "]";
                    if (log.isErrorEnabled()){
                        log.error(salt, sqle);
                    }

                    throw new AuthenticationException(salt, sqle);
                }
            }finally {
                JdbcUtils.closeConnection(conn);
            }

            return info ;
        }
    }

    /**
     * 用处 subject.hasRole("xxx"); subject.isPermitted("xxx"); @RequiresRoles("admin")加在方法上时
     * @param principals
     * @return
     */
    @Override
    public AuthorizationInfo doGetAuthorizationInfo (PrincipalCollection principals){
        if (principals == null){
            throw new AuthorizationException("PrincipalCollection method argument cannot be null");
        } else {
            String username = (String) this.getAvailablePrincipal(principals);
            Connection conn = null;

            Set<String> roleNames = null;
            Set permissions = null;

            try{
                conn = this.dataSource.getConnection();
                roleNames = this.getRoleNamesForUser(conn, username);
                if (this.permissionsLookupEnabled){
                    permissions = this.getPermissions(conn, username, roleNames);
                }
            } catch (SQLException sqle){
                String message = "There was a SQL error while authorizing user [" + username + "]";
                if (log.isErrorEnabled()){
                    log.error(message, sqle);
                }

                throw new AuthorizationException(message, sqle);
            } finally {
                JdbcUtils.closeConnection(conn);
            }

            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
            info.setStringPermissions(permissions);
            return info;
        }
    }

    private Set<String> getRoleNamesForUser(Connection conn, String username) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        LinkedHashSet roleNames = new LinkedHashSet();

        try{
            ps = conn.prepareStatement(this.userRolesQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()){
                String roleName = rs.getString(1);
                if (roleName != null){
                    roleNames.add(roleName);
                }else if (log.isWarnEnabled()){
                    log.warn("Null role name found while retrieving role names for user [" + username + "]");
                }
            }
        }finally {
            JdbcUtils.closeResultSet(rs);
            JdbcUtils.closeStatement(ps);
        }
        return roleNames;
    }

    private Set<String> getPermissions (Connection conn, String username, Collection<String> roleNames) throws SQLException {
        PreparedStatement ps = null;
        LinkedHashSet permissions = new LinkedHashSet();

        try{
            ps = conn.prepareStatement(this.permissionsQuery);
            Iterator i$ = roleNames.iterator();

            while (i$.hasNext()){
                String roleName = (String) i$.next();
                ps.setString(1, roleName);
                ResultSet rs = null;

                try{
                    rs = ps.executeQuery();

                    while(rs.next()){
                        String permissionString = rs.getString(1);
                        permissions.add(permissionString);
                    }
                }finally {
                    JdbcUtils.closeResultSet(rs);
                }
            }
        }finally {
            JdbcUtils.closeStatement(ps);
        }

        return permissions;
    }

    private String getSaltForUser(String username){
        return username;
    }

    private String[] getPasswordForUser(Connection conn, String username) throws SQLException {
        boolean returningSeparatedSalt= false;
        String[] result;
        switch (this.saltStyle){
            case NO_SALT:
            case CRYPT:
            case COLUMN:
            case EXTERNAL:
                result = new String[1];
                break;
            default:
                result = new String[2];
                returningSeparatedSalt = true;
        }

        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            ps = conn.prepareStatement(this.authenticationQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            for (boolean foundResult = false; rs.next(); foundResult = true){
                if (foundResult){
                    throw new AuthenticationException("More than one user row found for user ["+username+"]. Username must be unique 没有找到密码");
                }
                result[0] = rs.getString(1);
                if (returningSeparatedSalt){
                    result[1] = rs.getString(2);
                }
            }
        } finally {
            JdbcUtils.closeResultSet(rs);
            JdbcUtils.closeStatement(ps);
        }

        return result;
    }
}
