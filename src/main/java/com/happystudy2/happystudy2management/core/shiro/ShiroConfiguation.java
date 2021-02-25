package com.happystudy2.happystudy2management.core.shiro;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.happystudy2.happystudy2management.core.service.PasswordHelper;

import com.happystudy2.happystudy2management.loginCenter.CredentialMatcher;
import com.happystudy2.happystudy2management.loginCenter.TestMatcher;
import com.happystudy2.happystudy2management.loginCenter.UsernameRealm;
import com.happystudy2.happystudy2management.loginCenter.UsernameRealm2;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

@Configuration
public class ShiroConfiguation {

    @Bean
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        // SecurityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //loginUrl
        shiroFilterFactoryBean.setLoginUrl("/login");
        //无权限时候跳转
        shiroFilterFactoryBean.setUnauthorizedUrl("/login");

        //拦截器
        //权限map
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        //静态资源权限
        filterChainDefinitionMap.put("/css/**", "anon");
        filterChainDefinitionMap.put("/frame/**", "anon");
        filterChainDefinitionMap.put("/font/**", "anon");
        filterChainDefinitionMap.put("/img/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");
        filterChainDefinitionMap.put("/happy-study/home", "anon");
        //游客，开发权限
        filterChainDefinitionMap.put("/guest/**", "anon");
        //管理员，需要角色权限admin
        //filterChainDefinitionMap.put("/gradeMan/**", "admin");
        //开放登录接口
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/happy-study/**", "anon");
        //其余接口一律拦截
        //filterChainDefinitionMap.put("/**", "authc");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName(PasswordHelper.ALGORITHM_NAME);
        hashedCredentialsMatcher.setHashIterations(PasswordHelper.HASH_ITERATIONS);
        return hashedCredentialsMatcher;
    }

    /**
     * aop注解需要的配置
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;

    }
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    @Bean(name="simpleMappingExceptionResolve")
    public SimpleMappingExceptionResolver createSimpleMappingExceptionResolver() {
        SimpleMappingExceptionResolver r = new SimpleMappingExceptionResolver();
        Properties mappings = new Properties();
        mappings.setProperty("DatabaseException", "databaseError");//数据库异常处理
        mappings.setProperty("UnauthorizedException","403");
        r.setExceptionMappings(mappings);  // None by default
        r.setDefaultErrorView("error");    // No default
        r.setExceptionAttribute("ex");     // Default is "exception"
        //r.setWarnLogCategory("example.MvcLogger");     // No default
        return r;
    }
    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(usernameRealm());

        return securityManager;
    }

    @Bean
    public UsernameRealm2 usernameRealm(){
        /*
        UsernameRealm usernameRealm = new UsernameRealm();
        Properties prop = new Properties();
        InputStream is = ShiroConfiguation.class.getClassLoader().getResourceAsStream("druid.properties");
        try{
            prop.load(is);
            is.close();
            usernameRealm.setDataSource(DruidDataSourceFactory.createDataSource(prop));
        } catch (Exception e){
            e.printStackTrace();
        }*/
        UsernameRealm2 usernameRealm = new UsernameRealm2();
        usernameRealm.setCredentialsMatcher(credentialMatcher());

        return usernameRealm;
    }

    @Bean
    public CredentialMatcher credentialMatcher(){
        return new CredentialMatcher();
    }

}
