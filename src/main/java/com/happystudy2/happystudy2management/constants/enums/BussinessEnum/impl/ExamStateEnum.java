package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExamStateEnum implements BaseBussinessEnum {

    DOING(0, "执行中"),
    CREATING(1, "创建中"),
    DOABLE(2, "可执行"),
    DONE(3, "执行完毕"),
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
        for (ExamStateEnum e : ExamStateEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }
}
