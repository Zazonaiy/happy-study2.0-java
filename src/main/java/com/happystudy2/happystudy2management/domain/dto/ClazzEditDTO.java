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
public class ClazzEditDTO  extends BaseDTO {

    @ApiModelProperty("班级名称")
    @JsonProperty("clazzName")
    private String name;

    @ApiModelProperty("班主任id")
    private String clazzMasterId;

    @ApiModelProperty("班级类型 （0普通班 1文科班 2理科班 3艺体班）")
    private Integer clazzType;

    @ApiModelProperty("年级id")
    private String gradeId;


}
