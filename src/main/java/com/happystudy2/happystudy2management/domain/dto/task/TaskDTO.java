package com.happystudy2.happystudy2management.domain.dto.task;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.task.impl.BaseTaskImpl;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("TASK 对象")
@Builder
public class TaskDTO extends BaseDTO {

    @ApiModelProperty("task 名称")
    private String name;

    @ApiModelProperty("task 执行时间表达式")
    private String cron;

    private BaseTaskImpl task;
}
