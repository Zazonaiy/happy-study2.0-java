package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum TaskStateEnum implements BaseBussinessEnum {

    RUNABLE(1, "待运行"),
    RUNNING(2, "正在运行"),
    WAIT(3, "等待周期结束后继续运行")
    ,;

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
        if (Objects.isNull(code)){
            return null;
        }
        for (TaskStateEnum e : TaskStateEnum.values()){
            if (e.code.equals(code)){
                return e.getDescription();
            }
        }

        return null;
    }
}
