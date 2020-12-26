package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum SexEnum implements BaseBussinessEnum {

    MAN(0, "男"),
    WOMEN(1, "女");

    private Integer code;
    private String description;
    private static String ELSE_SEX = "unknown";

    public static String sexOf(Integer code){
        if (code.equals(MAN.code)){
            return MAN.description;
        }else if (code.equals(WOMEN.code)){
            return WOMEN.description;
        }else{
            return ELSE_SEX;
        }
    }

    public static Integer codeOf(String sex){
        if (StringUtils.equals(sex, MAN.description)){
            return MAN.code;
        }else if (StringUtils.equals(sex, WOMEN.description)){
            return WOMEN.code;
        }else{
            return null;
        }
    }

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
