package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum GradeTypeEnum implements BaseBussinessEnum {

    MIDDLE(1, "初中"),
    HIGH(2, "高中"),;

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


    public static String descriptionOf(Integer code){
        if (code.equals(MIDDLE.code)){
            return MIDDLE.description;
        }else if (code.equals(HIGH.code)){
            return HIGH.description;
        }else {
            return null;
        }
    }
}
