package com.happystudy2.happystudy2management.core.service;


import ma.glasnost.orika.MapperFactory;
import ma.glasnost.orika.MappingContext;
import ma.glasnost.orika.impl.DefaultMapperFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeMapper {

    protected final MapperFactory mapperFactory;

    public TypeMapper(){
        mapperFactory = new DefaultMapperFactory.Builder().build();
    }

    public <T> T map(Object obj, Class<T> targetType){
        return mapperFactory.getMapperFacade().map(obj, targetType);
    }

    public <T> T map(Object obj, Class<T> targetType, MappingContext context){
        return mapperFactory.getMapperFacade().map(obj, targetType, context);
    }

    public <T> List<T> mapList(List<?> source, Class<T> targetType){
        return mapperFactory.getMapperFacade().mapAsList(source, targetType);
    }

    public <T> List<T> mapList(List<?> source, Class<T> targetType, MappingContext context){
        return mapperFactory.getMapperFacade().mapAsList(source, targetType, context);
    }
}
