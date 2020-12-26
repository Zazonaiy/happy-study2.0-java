package com.happystudy2.happystudy2management.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static Integer mapAge(String birth){
        String now = DATE_FORMAT.format(new Date(System.currentTimeMillis()));

        String[] birthParam = birth.replace(" ","").split("-");
        String[] nowParams = now.replace(" ", "").split("-");
        Integer age = Integer.parseInt(nowParams[0]) - Integer.parseInt(birthParam[0]);

        Integer birthMounth = Integer.parseInt(birthParam[1]);
        Integer nowMounth = Integer.parseInt(nowParams[1]);
        Integer birthDay = Integer.parseInt(birthParam[2]);
        Integer nowDay = Integer.parseInt(nowParams[2]);
        age = birthMounth > nowMounth ? age-1 : birthMounth == nowMounth ? birthDay > nowDay ? age-1 : age : age;

        return age;
    }

}
