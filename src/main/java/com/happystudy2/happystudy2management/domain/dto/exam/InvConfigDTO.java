package com.happystudy2.happystudy2management.domain.dto.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;
import java.util.Map;

@EqualsAndHashCode
@Data
@ApiModel("每个考室的监考教师配置对象")
public class InvConfigDTO {

    //private String roomId;

    //@ApiModelProperty("每个考室的监考教师列表对象 的列表对象")
    //private List<List<InvTeacherDTO>> invTeacherList;

    @JsonProperty("roomMemberMap")
    private Map<String, List<ExamMemberDTO>> invTeacherRoomMap;
}
