package com.happystudy2.happystudy2management.core.domain.vo;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.TaskStateEnum;
import com.happystudy2.happystudy2management.core.task.TaskRunnable;
import lombok.*;

import java.util.concurrent.ScheduledFuture;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ScheduledFutureVO extends BaseVO {

    private String cron;

    private String name;

    private Integer taskNo;

    private ScheduledFuture<?> future;

    private TaskRunnable runnable;

    private TaskStateEnum state;

    private String waitTime;//等待时间(毫秒)

}
