package com.happystudy2.happystudy2management.task;

import com.happystudy2.happystudy2management.dao.task.TaskMapper;
import com.happystudy2.happystudy2management.domain.po.task.TaskPO;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

//@Configuration
//@EnableScheduling
public class DynamicScheduleTask implements SchedulingConfigurer {

    //@Autowired
    private TaskMapper taskMapper;


    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        /*
        TaskPO taskPO = getTaskById("11");

        scheduledTaskRegistrar.addTriggerTask(()->System.out.println("执行动态定时任务: "+ LocalDateTime.now().toLocalDate()),
                triggerContext -> {
                    String cron = taskPO.getCron();
                    if (StringUtils.isEmpty(cron)){
                        System.out.println("corn为空");
                    }
                    return new CronTrigger(cron).nextExecutionTime(triggerContext);
                }
                );

         */
    }

    private TaskPO getTaskById(String id){
        return taskMapper.selectByPrimaryKey(id);
    }
}
