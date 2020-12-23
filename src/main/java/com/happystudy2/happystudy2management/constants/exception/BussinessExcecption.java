package com.happystudy2.happystudy2management.constants.exception;

import com.happystudy2.happystudy2management.constants.enums.errorEnum.BaseErrorEnum;
import lombok.Data;

@Data
public class BussinessExcecption extends RuntimeException{

    /**
     *  异常错误码
     */
    protected String errorCode;

    /**
     * 格式化错误时所需要的参数列表
     */
    protected String[] params;

    public BussinessExcecption(BaseErrorEnum error, Throwable cause, String ...params){
        super(cause);
        this.errorCode = error.getCode();
        this.params = params;
    }

    public BussinessExcecption(BaseErrorEnum error, String ...params){
        this.errorCode = error.getCode();
        this.params = params;
    }
}
