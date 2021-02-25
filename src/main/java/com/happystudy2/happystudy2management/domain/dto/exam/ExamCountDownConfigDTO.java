package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Data
@ApiModel("班级修改表单对象")
public class ExamCountDownConfigDTO {

    @JsonProperty("fre")
    @ApiModelProperty("考试名称")
    private String frequency ;

    @ApiModelProperty("考试名称")
    private String doTime;

    @ApiModelProperty("考试名称")
    private Boolean doTimeNow;
}
