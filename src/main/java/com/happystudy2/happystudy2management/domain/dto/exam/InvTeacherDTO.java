package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Deprecated
@EqualsAndHashCode
@Data
@ApiModel("监考教师对象")
public class InvTeacherDTO {

    @ApiModelProperty("监考教师Id")
    private String id;

    @ApiModelProperty("监考教师姓名")
    private String name;
}
