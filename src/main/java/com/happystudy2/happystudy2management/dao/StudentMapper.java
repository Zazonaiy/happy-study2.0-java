package com.happystudy2.happystudy2management.dao;
import com.happystudy2.happystudy2management.core.dao.BaseMapper;
import com.happystudy2.happystudy2management.domain.po.StudentPO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper extends BaseMapper<StudentPO> {

}
