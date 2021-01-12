package com.happystudy2.happystudy2management.domain.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("班级修改表单对象")
public class CourseEditDTO extends BaseDTO {

    @ApiModelProperty("科目id")
    private String subjectId;

    @ApiModelProperty("课程班级id")
    private String clazzId;

    @ApiModelProperty("授课教师id")
    private String teacherId;

}
