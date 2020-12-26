package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.util.UUIDCreator;
import tk.mybatis.mapper.genid.GenId;

public class UUIDGenerator implements GenId<String> {

    @Override
    public String genId(String s, String s1){
        return UUIDCreator.randomUUID().replace("-", "");
    }
}
