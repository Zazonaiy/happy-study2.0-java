package com.happystudy2.happystudy2management.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
    public static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static Date now (){
        try{
            Date now = TIME_FORMAT.parse(TIME_FORMAT.format(new Date()));
            return now;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
