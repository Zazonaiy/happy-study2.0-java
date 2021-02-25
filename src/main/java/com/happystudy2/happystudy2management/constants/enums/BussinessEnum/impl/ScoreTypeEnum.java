package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ScoreTypeEnum implements BaseBussinessEnum {

    COMMON(0, "合格"),
    GOOD(1, "优秀"),
    FALL(2, "不合格"),
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

    public static String descriptionOf(Integer code){
        for (ScoreTypeEnum e : ScoreTypeEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }

    public static ScoreTypeEnum getType(Double score){
        if (score>=90.0){
            return ScoreTypeEnum.GOOD;
        }else if (score>=60.0){
            return ScoreTypeEnum.COMMON;
        }else{
            return ScoreTypeEnum.FALL;
        }
    }
}
