package com.happystudy2.happystudy2management.core.domain.dto;

import lombok.Builder;
import lombok.Data;

@Data
public class ResultCop {
    public static final Boolean SUCCESS = true;
    public static final Boolean FAILED = false;

    public static final Boolean WARN = true;
    public static final Boolean NOT_WARN = false;

    private Boolean isSuccess;
    private String description;
    private Boolean warnTag;

    public ResultCop(){
        this.isSuccess = ResultCop.SUCCESS;
        this.warnTag = ResultCop.NOT_WARN;
    }
}
