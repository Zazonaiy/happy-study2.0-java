package com.happystudy2.happystudy2management.core.service;

import tk.mybatis.mapper.version.NextVersion;
import tk.mybatis.mapper.version.VersionException;

import java.sql.Timestamp;
import java.util.Date;

public class DefaultNextVersion implements NextVersion {

    @Override
    public Object nextVersion(Object current) throws VersionException{
        if (current == null){
            throw new VersionException("当前版号为空");
        }
        if (current instanceof Integer){
            return (Integer) current+1;
        }else if (current instanceof Long){
            return (Long) current+1L;
        }else if (current instanceof Timestamp){
            return new Timestamp(System.currentTimeMillis());
        }else if (current instanceof Date){
            return new Date(System.currentTimeMillis());
        }else {
            throw new VersionException("默认的 NextVersion 不支持当前使用的版本号");
        }
    }
}
