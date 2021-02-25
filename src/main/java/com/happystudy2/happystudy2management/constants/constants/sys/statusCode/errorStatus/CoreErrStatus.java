package com.happystudy2.happystudy2management.constants.constants.sys.statusCode.errorStatus;

public class CoreErrStatus {

    /**
     * json处理错误
     */
    public static String JSON_PROCESSING_EXCEPTION = "0001";


    /**
     * 事务处理失败
     */
    public static String TRANSACTIONAL_FAILED_EXCEPTION = "1000";

    /**
     * 登录模块
     */
    public static String LOSE_ROLE = "5000"; //暂不支持当前角色或没找到该角色
    public static String LOSE_USER = "5001"; //没找到该用户
}
