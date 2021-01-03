package com.happystudy2.happystudy2management.core.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.PaginationParam;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ObjFormatter {
    @Autowired
    private TypeMapper typeMapper;

    public MetaData MapToMetaData(Map<String, Object> map){
        Object mapObj = map.get("filter");
        Map<String, Object> filterObjMap = JSONObject.parseObject(JSON.toJSONString(mapObj));
        Map<String, String> filterMap = new HashMap<>();
        if (Objects.nonNull(filterObjMap)){
            if (Objects.nonNull(filterObjMap.keySet())){
                for (String key : filterObjMap.keySet()){
                    filterMap.put(key, filterObjMap.get(key).toString());
                }
            }
        }

        Integer page = Objects.nonNull(map.get("paginationParam[page]")) ? this.objectToInteger(map.get("paginationParam[page]")) : 1;
        Integer pageSize = Objects.nonNull(map.get("paginationParam[pageSize]")) ? this.objectToInteger(map.get("paginationParam[pageSize]")) : 5;
        PaginationParam paginationParam = PaginationParam.builder().page(page).pageSize(pageSize).build();
        if (Objects.nonNull(map.get("paginationParam[totalCount]"))){
            paginationParam.setTotalCount(Long.parseLong(map.get("paginationParam[totalCount]").toString()));
        }
        if (Objects.nonNull(map.get("paginationParam[pageCount]"))){
            paginationParam.setPageCount(this.objectToInteger(map.get("paginationParam[pageCount]").toString()));
        }
        if (Objects.nonNull(map.get("paginationParam[orderBy]"))){
            paginationParam.setOrderBy(map.get("paginationParam[orderBy]").toString());
        }
        if (Objects.nonNull(map.get("paginationParam[orderWay]"))){
            paginationParam.setOrderBy(map.get("paginationParam[orderWay]").toString());
        }

        Object listObj = map.get("ext");
        List<String> extList = Lists.newArrayList();
        if (Objects.nonNull(listObj)){
            if (listObj instanceof ArrayList<?>){
                for (Object extObj : extList){
                    extList.add(String.class.cast(extObj));
                }
            }
        }

        return MetaData.builder().filter(filterMap).paginationParam(paginationParam).ext(extList).build();

    }

    public Integer objectToInteger(Object obj){
        return Integer.parseInt(obj.toString());
    }

    public Long objectToLong(String obj){
        return Long.parseLong(obj.toString());
    }
}
