package com.happystudy2.happystudy2management.core.handler;

import com.happystudy2.happystudy2management.core.annotation.JsonObject;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import java.lang.reflect.Field;

public class JsonObjectArgResolverHandler implements HandlerMethodArgumentResolver {

    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.hasMethodAnnotation(JsonObject.class);
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        //获取参数名
        String name = methodParameter.getParameterName();
        //获取参数类型
        Class clazz = methodParameter.getParameterType();
        Object arg = null;
        //获取该参数实体的所有属性
        Field[] fields = clazz.getDeclaredFields();
        //实例化
        Object target = clazz.newInstance();

        //创建webDataBinder对象 反射 遍历field给属性赋值
        WebDataBinder binder = webDataBinderFactory.createBinder(nativeWebRequest, null, name);
        for (Field field : fields){
            field.setAccessible(true);
            String fieldName = field.getName();
            Class<?> fieldType = field.getType();

            String value = nativeWebRequest.getParameter(name + "[" + fieldName + "]");
            arg = binder.convertIfNecessary(value,fieldType,methodParameter);
            field.set(target, arg);
        }
        return target;
    }
}
