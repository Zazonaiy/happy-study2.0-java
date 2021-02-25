package com.happystudy2.happystudy2management.domain.dto.score;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("考试成绩修改表单对象")
public class ScoreEditDTO extends BaseDTO {

    @ApiModelProperty("")
    @JsonProperty("examSubjectId")
    private String examSubjectId;

    @ApiModelProperty("")
    @JsonProperty("marTeacherId")
    private String examTeacMarId;

    @ApiModelProperty("")
    @JsonProperty("subjectStudentId")
    private String examSubStuId;

    //用来判断角色权限
    @ApiModelProperty("用户名")
    private String userName;

    @ApiModelProperty("")
    private Double score;

}
