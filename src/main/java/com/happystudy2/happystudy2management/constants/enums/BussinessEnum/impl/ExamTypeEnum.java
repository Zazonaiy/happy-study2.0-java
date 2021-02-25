package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExamTypeEnum implements BaseBussinessEnum {
    //TODO: 也许ExamTypeEnum和创建考试->考试基本信息那儿的考试类型没有对应上
    WEEK(1, "周考"),
    MONTH(2, "月考"),
    SUB_SEMES(2, "半期考试"),
    SEMES(3, "期末考试"),
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
        for (ExamTypeEnum e : ExamTypeEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }
}
