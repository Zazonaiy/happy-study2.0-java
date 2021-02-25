package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Deprecated
@EqualsAndHashCode
@Data
@ApiModel("每个考场的学生名单对象")
public class StudentRoomDTO {
    @ApiModelProperty("学生id")
    private String id;

    @ApiModelProperty("学生姓名")
    private String name;
}
