package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode
@Data
@ApiModel("考试提醒配置(开考提醒/毕考提醒) 对象")
public class ExamRemindConfigItemDTO {

    @ApiModelProperty("考试名称")
    private Boolean remind;

    @ApiModelProperty("执行时间列表")
    private List<Integer> doTime;
}
