package com.happystudy2.happystudy2management.core.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import org.apache.commons.lang3.ArrayUtils;

public class ReflectionUtils {

    static Boolean checkName (Member member, String targetName, Boolean ignoreCase){
        if (ignoreCase){
            if (member.getName().equalsIgnoreCase(targetName)){
                return true;
            }
        }else if(member.getName().equals(targetName)){
            return true;
        }

        return false;
    }

    public static Method getMethod(Object target, String methodName, Boolean ignoreCase){
        if (target == null){
            return null;
        }else {
            Method[] methods = target.getClass().getDeclaredMethods();
            if (ArrayUtils.isEmpty(methods)){
                return null;
            }else {
                Method[] arr$ = methods;
                int len$ = methods.length;

                for (int i$ = 0; i$ < len$; ++i$){
                    Method method = arr$[i$];
                    if (checkName(method, methodName, ignoreCase)){
                        return method;
                    }
                }

                return null;
            }
        }
    }

    public static Method getMethod(Object target, String methodName){
        return getMethod(target, methodName, false);
    }

    public static Field getField(Object target, String propertyName, Boolean ignoreCase){
        if (target == null){
            return null;
        }else {
            Field[] fields = target.getClass().getDeclaredFields();
            if (ArrayUtils.isEmpty(fields)){
                return null;
            }else{
                Field[] arr$ = fields;
                int len$ = fields.length;

                for (int i$ = 0; i$ < len$; ++i$){
                    Field f = arr$[i$];
                    if (checkName(f, propertyName,ignoreCase)){
                        return f;
                    }
                }

                return null;
            }
        }
    }

    public static Field getField(Object target, String propertyName){
        return getField(target, propertyName, false);
    }

    public static void setField(Object target, String propertyName, Boolean ignoreCase, Object propertyValue) throws IllegalAccessException {
        Field field = getField(target, propertyName, ignoreCase);
        if (field != null){
            field.set(target, propertyValue);
        }
    }

    public static void setField(Object target, String propertyName, Object propertyValue) throws IllegalAccessException {
        setField(target, propertyName, false, propertyValue);
    }

    public static void callMethod(Object target, String methodName, Object... args) throws InvocationTargetException, IllegalAccessException {
        callMethod(target, methodName, false, args);
    }

    public static void callMethod(Object target, String methodName, Boolean ignoreCase, Object... args) throws InvocationTargetException, IllegalAccessException {
        Method method = getMethod(target, methodName, ignoreCase);
        if (method != null) {
            method.invoke(target, args);
        }

    }


}
