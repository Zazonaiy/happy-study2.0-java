package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("考室成员配置对象")
public class ExamRegistMemberDTO extends BaseDTO {

    //@ApiModelProperty("考试Id")
    //private String examId;

    //@JsonProperty("memberConfig")
    //@ApiModelProperty("考试名称")
    //private ExamMemberConfigListDTO examMemberConfigListDTO;
    @ApiModelProperty("考试科目id")
    private String examId;

    @JsonProperty("memberConfigList")
    @ApiModelProperty("考试成员配置列表")
    List<ExamMemberConfigDTO> examMemberConfigDTOList;

}
