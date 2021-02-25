package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode
@Data
@ApiModel("每个科目 参考人员配置对象")
public class ExamMemberConfigDTO {

    @JsonProperty("subjectId")
    private String examSubjectId;

    @JsonProperty("invConfig")
    private InvConfigDTO invConfig;

    @ApiModelProperty("科目列表<改卷教师列表> 对象")
    @JsonProperty("marConfig")
    private MarConfigDTO marConfig;

    @JsonProperty("studentConfig")
    private StudentConfigDTO studentConfig;

}
