package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ProStateEnum implements BaseBussinessEnum {

    APPLYING(0, "申请中"),
    WAIT(1, "待审批"),
    OVER(2, "流程结束"),
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
        for (ProStateEnum e : ProStateEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }
}
