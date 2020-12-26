package com.happystudy2.happystudy2management.util;

import cn.hutool.core.util.IdUtil;

public class UUIDCreator {

    public static String randomUUID(){
        return IdUtil.fastSimpleUUID();
    }
}
