package com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExamRoomRentStateEnum implements BaseBussinessEnum {
    FAILD(0, "申请失败"),
    SUCCESS(1, "申请成功"),
    WAIT(2, "待审批"),;

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
        for (ExamRoomRentStateEnum e : ExamRoomRentStateEnum.values()){
            if (e.code.equals(code)){
                return e.description;
            }
        }
        return null;
    }
}
