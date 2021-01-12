package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.core.task.TaskRunnable;
import com.happystudy2.happystudy2management.dao.TaskMapper;
import com.happystudy2.happystudy2management.domain.po.TaskPO;
import com.happystudy2.happystudy2management.task.DynamicTask;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private DynamicTask dynamicTask;

    @Override
    public void test(){
        List<IBaseTask> testTasks = Lists.newArrayList();
        testTasks.add(()->{
            System.out.println("动态生成task测试");
        });
        TaskRunnable runnable = TaskRunnable.builder().tasks(testTasks).build();
        //dynamicTask.startCron(runnable, taskMapper.selectByPrimaryKey("11"), true);
        dynamicTask.createCron(runnable, taskMapper.selectByPrimaryKey("11"), true);
    }

    @Override
    public void test2(){
        List<IBaseTask> testTasks = Lists.newArrayList();
        testTasks.add(()->{
            System.out.println("动态生成task测试 2");
        });
        TaskRunnable runnable = TaskRunnable.builder().tasks(testTasks).build();
        //dynamicTask.startCron(runnable, taskMapper.selectByPrimaryKey("11"), true);
        dynamicTask.createCron(runnable, taskMapper.selectByPrimaryKey("22"), true);
        //dynamicTask.stopCron(taskMapper.selectByPrimaryKey("11"));
    }
    @Override
    public void test3(){
        TaskPO taskPO1 = taskMapper.selectByPrimaryKey("11");
        TaskPO taskPO2 = taskMapper.selectByPrimaryKey("22");
        dynamicTask.stopCron(taskPO1, false);
        dynamicTask.deleteTask(taskPO1);
        dynamicTask.stopCron(taskPO2, true);
    }

}
