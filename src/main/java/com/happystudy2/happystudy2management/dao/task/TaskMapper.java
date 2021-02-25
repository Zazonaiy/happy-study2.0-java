package com.happystudy2.happystudy2management.dao.task;

import com.happystudy2.happystudy2management.core.dao.BaseMapper;
import com.happystudy2.happystudy2management.domain.po.task.TaskPO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaskMapper extends BaseMapper<TaskPO> {
}
