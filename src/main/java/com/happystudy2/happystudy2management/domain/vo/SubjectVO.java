package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class SubjectVO extends BaseVO {

    private Integer subNo;

    @JsonProperty("subjectName")
    private String name;

    private TypeVO subjectType;

    private Integer gradeCount;

    private Integer courseCount;

    private Integer studentCount;
}
