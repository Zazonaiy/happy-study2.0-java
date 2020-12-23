package com.happystudy2.happystudy2management.util;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.CommonErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.fasterxml.jackson.core.type.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

@Slf4j
@JsonIgnoreProperties
public class JacksonUtils {
    private static ObjectMapper objectMapper = new ObjectMapper();

    public static <T> String toJsonString (T obj){
        if (obj == null){
            return null;
        }
        try{
            return obj instanceof String ? (String) obj : objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e){
            throw new BussinessExcecption(CommonErrorCodeEnum.JSON_PROCESSING_EXCEPTION);
        }
    }

    public static <T> String toJsonStringPretty(T obj){
        if (obj == null){
            return null;
        }
        try{
            return obj instanceof String ? (String) obj : objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e){
            throw new BussinessExcecption(CommonErrorCodeEnum.JSON_PROCESSING_EXCEPTION);
        }
    }

    public static <T> T parseObject(String str, Class<T> clazz){
        if (StringUtils.isBlank(str)){
            return null;
        }
        try{
            return clazz.equals(String.class) ? (T) str : objectMapper.readValue(str, clazz);
        } catch (JsonProcessingException e){
            throw new BussinessExcecption(CommonErrorCodeEnum.JSON_PROCESSING_EXCEPTION);
        }
    }

    public static <T> T parseObject(String str, TypeReference<T> typeReference){
        if (StringUtils.isBlank(str)){
            return null;
        }
        try{
            return (T) (typeReference.getType().equals(String.class) ? str : objectMapper.readValue(str, typeReference));
        } catch (JsonProcessingException e){
            throw new BussinessExcecption(CommonErrorCodeEnum.JSON_PROCESSING_EXCEPTION);
        }
    }

    public static <T> T parseObject(String str, Class<?> collectionClazz, Class<?>...elementClazzes){
        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(collectionClazz, elementClazzes);
        try{
            return objectMapper.readValue(str, javaType);
        }catch (JsonProcessingException e){
            throw new BussinessExcecption(CommonErrorCodeEnum.JSON_PROCESSING_EXCEPTION);
        }
    }
}
