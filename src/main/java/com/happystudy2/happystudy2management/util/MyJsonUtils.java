package com.happystudy2.happystudy2management.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.List;
import java.util.Map;

public class MyJsonUtils {
    public static JSONArray ListToJSONArray(List<Object> list){
        JSONArray array = new JSONArray();
        for (Object obj : list){
            JSONObject json = JacksonUtils.parseObject(JacksonUtils.toJsonString(obj), JSONObject.class);
            array.add(json);
        }
        return array;
    }

    public static JSONArray mapListToArray(List<Map<String, Object>> mapList){
        JSONArray array = new JSONArray();
        for (Map<String, Object> map : mapList){
            JSONObject json = new JSONObject(map);
            array.add(json);
        }
        return array;
    }
}
