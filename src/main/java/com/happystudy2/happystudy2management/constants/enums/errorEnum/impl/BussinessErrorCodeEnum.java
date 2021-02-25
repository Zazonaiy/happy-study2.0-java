package com.happystudy2.happystudy2management.constants.enums.errorEnum.impl;

import com.happystudy2.happystudy2management.constants.constants.sys.statusCode.errorStatus.CoreErrStatus;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.BaseErrorEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum BussinessErrorCodeEnum implements BaseErrorEnum {

    TRANSACTIONAL_FAILED_ERROR(CoreErrStatus.TRANSACTIONAL_FAILED_EXCEPTION, "事务处理失败"),
    LOSE_ROLE(CoreErrStatus.LOSE_ROLE, "暂不支持当前角色或没找到该角色"),
    LOSE_USER(CoreErrStatus.LOSE_USER, "用户不存在")
    ,;


    private String code;

    private String description;

    @Override
    public String getCode(){ return this.code; }

    @Override
    public String getDescription() {
        return this.description;
    }

    @Override
    public String toString(){
        return code;
    }
}
