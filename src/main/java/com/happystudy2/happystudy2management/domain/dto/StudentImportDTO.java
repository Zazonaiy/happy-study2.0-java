package com.happystudy2.happystudy2management.domain.dto;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("学生修改表单对象")
public class StudentImportDTO extends BaseDTO {

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("性别")
    private Integer sex;

    @ApiModelProperty("生日")
    private String birthday;

    @ApiModelProperty("职责")
    private String respType;

    @ApiModelProperty("班级号")
    private Integer clazzNo;

    @ApiModelProperty("父亲姓名")
    private String fatherName;

    @ApiModelProperty("父亲电话号码")
    private String fatherPhone;

    @ApiModelProperty("母亲电姓名")
    private String motherName;

    @ApiModelProperty("母亲电话号码")
    private String motherPhone;

    @ApiModelProperty("紧急联系人姓名")
    private String emContactName;

    @ApiModelProperty("紧急联系人电话号码")
    private String emContactPhone;
}
