package com.happystudy2.happystudy2management.domain.dto.exam;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("班级修改表单对象")
public class ExamRegistDTO extends BaseDTO {

    @ApiModelProperty("考试名称")
    private String name;

    @ApiModelProperty("学期id")
    private String semesterId;

    @ApiModelProperty("年级id")
    private String gradeId;

    @ApiModelProperty("考试类型")
    private Integer examType;

    @ApiModelProperty("开始时间")
    private String beginDate;

    @ApiModelProperty("结束时间")
    private String endDate;


    @ApiModelProperty("考室配置")
    private ExamRegistRoomDTO examRegistRoom;


    @ApiModelProperty("考室科目列表")
    private List<ExamRegistSubjectDTO> subjectList;


}
