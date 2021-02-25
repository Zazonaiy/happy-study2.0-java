package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Data
@ApiModel("考试提醒配置 对象")
public class ExamRemindConfigDTO {

    @ApiModelProperty("考试开始")
    private ExamRemindConfigItemDTO begin;

    @ApiModelProperty("考试结束")
    private ExamRemindConfigItemDTO end;
}
