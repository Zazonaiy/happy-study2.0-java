package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.domain.dto.task.TaskDTO;

import java.util.List;

public interface TaskService {

    void test();
    void test2();
    void test3();

    ResultCop createTask(TaskDTO taskConfig, Boolean start);
    ResultCop createTask(List<TaskDTO> taskConfigList, Boolean start);
}
