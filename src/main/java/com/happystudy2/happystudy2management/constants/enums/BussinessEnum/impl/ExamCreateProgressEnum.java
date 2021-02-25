package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExamCreateProgressEnum implements BaseBussinessEnum {

    DOING(0, "已完成"),
    CREATING(3, "人员配置"),
    DOABLE(4, "创建任务")
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
        for (ExamCreateProgressEnum e : ExamCreateProgressEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }
}
