package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;
import java.util.Map;

@EqualsAndHashCode
@Data
@ApiModel("学生考室配置")
public class StudentConfigDTO {

    @ApiModelProperty("是否由系统分配学生考场")
    private Boolean randomStudent;

    //@ApiModelProperty("考场Id")
    //private String roomId;

    @JsonProperty("roomMemberMap")
    @ApiModelProperty("考场学生名单 的列表对象")
    private Map<String, List<ExamMemberDTO>> studentRoomMap;
}
