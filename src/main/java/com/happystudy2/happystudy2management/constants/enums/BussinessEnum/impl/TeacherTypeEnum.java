package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum TeacherTypeEnum implements BaseBussinessEnum {

    SCHOOLE_MASTER(1, "校长"),
    GRADE_MASTER(2, "年级主任"),
    CLAZZ_MASTER(3, "班主任"),
    COMMON_TEACHER(4, "一般任课教师"),
    ;

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

    public static TeacherTypeEnum codeOf (Integer code){
        TeacherTypeEnum[] z = TeacherTypeEnum.values();
        for (TeacherTypeEnum e : z){
            if (e.getCode().equals(code)){
                return e;
            }
        }
        return null;
    }

}
