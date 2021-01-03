package com.happystudy2.happystudy2management.core.interceptor;

import com.happystudy2.happystudy2management.core.util.ReflectionUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;

import org.apache.ibatis.plugin.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tk.mybatis.mapper.version.VersionException;

import java.util.Date;
import java.util.Properties;

@Intercepts({
        @Signature(type = Executor.class, method = LastModifyTimeInterceptor.METHOD_UPDATE, args = {
                MappedStatement.class, Object.class
        })
})
public class LastModifyTimeInterceptor implements Interceptor {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    public static final String METHOD_UPDATE = "update";
    public static final String[] METHOD_SET_LAST_MODIFY_TIME = new String[]{"lastModifyTime", "last_modify_time"};

    @Override
    public Object intercept(Invocation invocation) throws Throwable{
        String methodName = invocation.getMethod().getName();
        if (methodName.equalsIgnoreCase(LastModifyTimeInterceptor.METHOD_UPDATE)){
            Object parameter = invocation.getArgs()[1];
            Date empty = null;
            try{
                for (String s : METHOD_SET_LAST_MODIFY_TIME){
                    ReflectionUtils.callMethod(parameter, s, true, empty);
                }
            } catch (Exception e){
                logger.warn("lastModifyTime error: " + e.getMessage() + ",class:" + parameter.getClass());
                //throw new VersionException("版号更新失败");
            }
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object o ){
        return Plugin.wrap(o, this);
    }

    @Override
    public void setProperties(Properties properties){

    }

}
