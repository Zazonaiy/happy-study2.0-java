package com.happystudy2.happystudy2management.constants.enums.errorEnum.impl;

import com.happystudy2.happystudy2management.constants.constants.sys.statusCode.errorStatus.CoreErrStatus;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.BaseErrorEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum CommonErrorCodeEnum implements BaseErrorEnum {
    /**
     * json处理错误
     */
    JSON_PROCESSING_EXCEPTION(CoreErrStatus.JSON_PROCESSING_EXCEPTION, "json processing exception"),
    ;

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
