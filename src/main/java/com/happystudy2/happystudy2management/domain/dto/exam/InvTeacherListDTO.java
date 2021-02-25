package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Deprecated
@EqualsAndHashCode
@Data
@ApiModel("监考教师列表对象")
public class InvTeacherListDTO {
    //TODO: 暂且弃用
    @ApiModelProperty("每个考室的监考教师列表")
    private List<InvTeacherDTO> invTeacherList;
}
