package com.happystudy2.happystudy2management.domain.dto;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("学生修改表单对象")
public class StudentEditDTO extends BaseDTO {

    @ApiModelProperty("学生姓名")
    private String name;

    @ApiModelProperty("出生日期")
    private String birthday;

    @ApiModelProperty("学生性别")
    private Integer sex;

    @ApiModelProperty("所在年级")
    private String gradeId;

    @ApiModelProperty("所处班级")
    private String clazzId;

    @ApiModelProperty("父亲姓名")
    private String fatherName;

    @ApiModelProperty("父亲手机号码")
    private String fatherPhone;

    @ApiModelProperty("母亲姓名")
    private String motherName;

    @ApiModelProperty("母亲手机号码")
    private String motherPhone;

    @ApiModelProperty("紧急联系人姓名")
    private String emContactName;

    @ApiModelProperty("紧急联系人手机号码")
    private String emContactPhone;


}
