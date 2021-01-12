package com.happystudy2.happystudy2management.domain.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("学生修改表单对象")
public class GradeEditDTO extends BaseDTO {

    @ApiModelProperty("年级名称")
    @JsonProperty("gradeName")
    private String name;

    @ApiModelProperty("年级类型")
    private Integer gradeType;

    @ApiModelProperty("年级主任id")
    private String gradeMasterId;

    @ApiModelProperty("入学时间")
    private String enterStudyTime;

    @ApiModelProperty("毕业时间")
    private String endStudyTime;
}
