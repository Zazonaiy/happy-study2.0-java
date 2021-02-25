package com.happystudy2.happystudy2management.constants.constants.bussiness;

public class ExamRoomNameFormatter {
    public final static String COMMENT = "第x考场";
    public final static String ELSE_PALCE = "其他场地（未启用编号）";

    public static String formatIt (String examRoomNameFormatter, String value){
        String[] strs = examRoomNameFormatter.split("x");
        return strs[0] + value +strs[1];
    }
}
