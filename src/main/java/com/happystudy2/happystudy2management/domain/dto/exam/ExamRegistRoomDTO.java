package com.happystudy2.happystudy2management.domain.dto.exam;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ExamRegistRoomDTO extends BaseDTO {

    @ApiModelProperty("使用本年级教室")
    private Boolean useOurGradeRoom;

    @ApiModelProperty("使用其他年级教室")
    private Boolean rentTag;

    @ApiModelProperty("使用其他场地")
    private Boolean differentPlaceTag;

    @ApiModelProperty("每间考室容纳人数")
    private Integer maxSize;

    @ApiModelProperty("租用年级对象id")
    private String rentGradeId;

    @ApiModelProperty("租用申请说明")
    private String rentRemark;

    @ApiModelProperty("使用其它场地说明")
    private String differentPlaceRemark;

    @ApiModelProperty("其他场地是否配置虚拟考室编号")
    private Boolean useVirtualRoomNo;
}
