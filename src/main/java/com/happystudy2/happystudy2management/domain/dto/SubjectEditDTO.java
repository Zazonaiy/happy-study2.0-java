package com.happystudy2.happystudy2management.domain.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("科目修改表单对象")
public class SubjectEditDTO extends BaseDTO {

    @ApiModelProperty("科目名称")
    @JsonProperty("subjectName")
    private String name;

    @ApiModelProperty("科目类型")
    private Integer subjectType;
}
