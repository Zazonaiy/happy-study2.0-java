package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.core.task.TaskRunnable;
import com.happystudy2.happystudy2management.dao.task.TaskMapper;
import com.happystudy2.happystudy2management.domain.dto.task.TaskDTO;
import com.happystudy2.happystudy2management.domain.po.task.TaskPO;
import com.happystudy2.happystudy2management.service.TaskService;
import com.happystudy2.happystudy2management.task.DynamicTask;
import com.happystudy2.happystudy2management.task.impl.BaseTaskImpl;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private DynamicTask dynamicTask;
    @Autowired
    private NoGenerator noGenerator;

    private static final String SUCCESS_CREATE_TASK = "创建任务成功";
    private static final String ERROR_LOSE_CORN = "缺少时间表达式";
    private static final String ERROR_CREATE_TASK = "创建任务失败";
    private static final String DEFAULT_BASE_TASK_NAME = "task";

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

    @Transactional
    @Override
    public ResultCop createTask(TaskDTO taskConfig, Boolean start){
        ResultCop resultCop = new ResultCop();

        BaseTaskImpl task = taskConfig.getTask();
        if (StringUtils.isBlank(taskConfig.getCron())){
            resultCop.setIsSuccess(false);
            resultCop.setDescription(TaskServiceImpl.ERROR_LOSE_CORN);
            return resultCop;
        }
        TaskPO taskPO = typeMapper.map(taskConfig, TaskPO.class);
        Integer no = noGenerator.taskNo();
        if (StringUtils.isBlank(taskConfig.getName())){
            taskPO.setName(TaskServiceImpl.DEFAULT_BASE_TASK_NAME + String.valueOf(no));
        }

        try{
            taskPO.setTaskNo(no);
            taskMapper.insertSelective(taskPO);

            taskPO.setDeleted(false);
            TaskPO select = taskMapper.selectOne(taskPO);
            task.setId(select.getId());

            List<IBaseTask> taskList = Lists.newArrayList();
            taskList.add(task);


            if (!this.doCreateTask(taskList, taskPO, start)){
                throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
            }

            resultCop.setIsSuccess(true);
            resultCop.setDescription(TaskServiceImpl.SUCCESS_CREATE_TASK);
        } catch (RuntimeException e){
            e.printStackTrace();
            resultCop.setIsSuccess(false);
            resultCop.setDescription(TaskServiceImpl.ERROR_CREATE_TASK);
        }finally {
            return resultCop;
        }

    }

    @Transactional
    @Override
    public ResultCop createTask(List<TaskDTO> taskConfigList, Boolean start){
        List taskList = Lists.newArrayList();
        //ResultCop resultCop = new ResultCop();

        for (TaskDTO taskConfig : taskConfigList){
            ResultCop resultCop = createTask(taskConfig, start);
            if (!resultCop.getIsSuccess()){
                return resultCop;
            }
        }

        ResultCop resultCop = new ResultCop();
        resultCop.setIsSuccess(true);
        resultCop.setDescription(TaskServiceImpl.SUCCESS_CREATE_TASK);
        return resultCop;
    }


    private boolean doCreateTask(List<IBaseTask> taskList, TaskPO taskPO, Boolean start){
        TaskRunnable runnable = TaskRunnable.builder().tasks(taskList).build();
        return dynamicTask.createCron(runnable, taskPO, start);

    }
}
