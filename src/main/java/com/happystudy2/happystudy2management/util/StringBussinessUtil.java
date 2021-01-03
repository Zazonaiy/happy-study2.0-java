package com.happystudy2.happystudy2management.util;

public class StringBussinessUtil {
    public static final String ID_SPLITE_FORMATE = "-";

    public static String[] splitIds(String ids){
        return ids.replaceAll(" ", "").split(StringBussinessUtil.ID_SPLITE_FORMATE);
    }
}
