package com.happystudy2.happystudy2management.util;

import java.lang.reflect.Field;

public class ObjReflectUtil {

    public static boolean fieldAllFilledWithoutFather(Object obj) throws IllegalAccessException {
        Class cls = obj.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field field : fields){
            field.setAccessible(true);
            if (field.get(obj)==null){
                String name = field.getName();
                if (name.equals("id")||name.equals("createUser")||name.equals("createTime")|| name.equals("lastModifyUser")||
                        name.equals("lastModifyTime")||name.equals("deleted")||name.equals("remark")){
                    continue;
                }
                return false;
            }
        }

        return true;
    }

}
