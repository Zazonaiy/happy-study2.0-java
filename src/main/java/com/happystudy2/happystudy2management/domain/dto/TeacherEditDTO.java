package com.happystudy2.happystudy2management.domain.dto;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("教师修改表单对象")
public class TeacherEditDTO extends BaseDTO {

    @ApiModelProperty("教师姓名")
    private String name;

    @ApiModelProperty("教师性别")
    private Integer sex;

    @ApiModelProperty("出生日期")
    private String birthday;

    @ApiModelProperty("所在年级id")
    private String gradeId;

    @ApiModelProperty("教师类型")
    private Integer teacherType;
}
