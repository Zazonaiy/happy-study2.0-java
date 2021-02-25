package com.happystudy2.happystudy2management.domain.dto.exam;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Data
@ApiModel("监考教师对象")
public class ExamMemberDTO {

    private String id;

    private String name;
}
