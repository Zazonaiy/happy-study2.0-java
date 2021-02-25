package com.happystudy2.happystudy2management.domain.dto.exam;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("创建考试提醒任务 对象")
public class ExamRegistTaskDTO extends BaseDTO {

    @ApiModelProperty("考试Id")
    private String examId;

    @ApiModelProperty("是否创建考试提醒")
    private Boolean createExamRemind;

    @ApiModelProperty("是否创建考试倒计时")
    private Boolean createExamCountDown;

    @ApiModelProperty("考试提醒配置信息")
    private ExamRemindConfigDTO examRemind;

    @ApiModelProperty("考试倒计时配置信息")
    private ExamCountDownConfigDTO examCountDown;
}
