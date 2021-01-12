package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ResponsibilityTeacherEnum implements BaseBussinessEnum {

    COMMON_TEACHER(1, "commonTeacher"),
    CLAZZ_MASTER(10, "clazzMaster"),
    GRADE_MASTER(20, "gradeMaster"),
    SCHOOL_MASTER(30, "schoolMaster"),;

    private Integer code;
    private String description;

    @Override
    public Integer getCode(){ return this.code; }

    @Override
    public String getDescription() {
        return this.description;
    }

    @Override
    public String toString(){
        return String.valueOf(code);
    }
}
