package com.happystudy2.happystudy2management.task;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.TaskStateEnum;
import com.happystudy2.happystudy2management.core.domain.vo.ScheduledFutureVO;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.core.task.TaskRunnable;
import com.happystudy2.happystudy2management.domain.po.TaskPO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ScheduledFuture;

@Component
public class DynamicTask {
    @Autowired
    private ThreadPoolTaskScheduler threadPoolTaskScheduler;
    @Autowired
    private TypeMapper typeMapper;
    //private Map<String, ScheduledFuture<?>> futureMap = new HashMap<>();
    private Map<String, ScheduledFutureVO> futureEntityMap = new HashMap<>();

    @Bean
    public ThreadPoolTaskScheduler threadPoolTaskScheduler (){
        return new ThreadPoolTaskScheduler();
    }

    public Boolean createCron(TaskRunnable taskRunnable, TaskPO taskPO, Boolean run){
        String cron = taskPO.getCron();
        String id = taskPO.getId();
        if (StringUtils.isBlank(cron)||StringUtils.isBlank(id)||Objects.isNull(taskRunnable)){
            return false;
        }

        ScheduledFutureVO entity = typeMapper.map(taskPO, ScheduledFutureVO.class);
        entity.setState(TaskStateEnum.RUNABLE);
        entity.setRunnable(taskRunnable);
        futureEntityMap.put(id, entity);

        if (run){
            if (startCron(taskPO)){
                return true;
            }else{
                return false;
            }
        }
        return true;
    }
    public Boolean startCron(TaskPO taskPO){
        String id = taskPO.getId();
        if (StringUtils.isBlank(id)){
            return false;
        }
        ScheduledFutureVO futureEntity = futureEntityMap.get(id);

        if (Objects.isNull(futureEntity)){
            return false;
        }
        ScheduledFuture<?> future = threadPoolTaskScheduler.schedule(futureEntity.getRunnable(), triggerContext->{
            String cron = futureEntity.getCron();
            return new CronTrigger(cron).nextExecutionTime(triggerContext);
        });

        futureEntity.setFuture(future);
        futureEntity.setState(TaskStateEnum.RUNNING);
        System.out.println("DynamicTask.startCron()");

        return true;
    }
    /*
    public Boolean startCron(RunnableImpl runnableImpl, TaskPO taskPO){
        String cron = taskPO.getCron();
        ScheduledFuture<?> future = threadPoolTaskScheduler.schedule(runnableImpl, triggerContext->{
            return new CronTrigger(cron).nextExecutionTime(triggerContext);
        });
        System.out.println("DynamicTask.startCron()");
        futureMap.put(taskPO.getId(), future);
        System.out.println("DynamicTask has been put into map");
        return true;
    }

     */

    public Boolean stopCron(TaskPO taskPO, Boolean delTask){
        String id = taskPO.getId();
        if (StringUtils.isBlank(id)){
            return false;
        }
        ScheduledFutureVO futureEntity = futureEntityMap.get(id);
        ScheduledFuture future = futureEntity.getFuture();
        future.cancel(true);
        futureEntity.setState(TaskStateEnum.RUNABLE);
        System.out.println("DynamicTask.stopCron()");

        if (delTask){
            if (deleteTask(taskPO)){
                return true;
            }
            return false;
        }
        return true;
    }

    public Boolean deleteTask(TaskPO taskPO){
        String id = taskPO.getId();
        if (StringUtils.isBlank(id)){
            return false;
        }
        ScheduledFutureVO futureEntity = futureEntityMap.get(id);
        if (!futureEntity.getState().equals(TaskStateEnum.RUNABLE)){
            return this.stopCron(taskPO, true);
        }

        futureEntityMap.remove(id);
        System.out.println("DynamicTask.deleteCron()");
        return true;
    }

    //TODO 任务延时运行
    /*
    public Boolean stopCron(TaskPO taskPO){
        String id = taskPO.getId();
        if (StringUtils.isBlank(id)){
            return false;
        }
        ScheduledFuture<?> future = futureMap.get(id);
        future.cancel(true);
        System.out.println("DynamicTask.stopCron()");
        futureMap.remove(id);
        return true;
    }
     */
}
