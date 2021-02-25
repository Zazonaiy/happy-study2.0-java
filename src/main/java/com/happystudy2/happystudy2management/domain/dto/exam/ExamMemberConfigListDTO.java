package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Deprecated
@EqualsAndHashCode
@Data
@ApiModel("每个科目的考试成员配置")
public class ExamMemberConfigListDTO {
    @ApiModelProperty("考试科目id")
    private String examId;

    @JsonProperty("memberConfigList")
    @ApiModelProperty("考试成员配置列表")
    List<ExamMemberConfigDTO> examMemberConfigDTOList;
}
