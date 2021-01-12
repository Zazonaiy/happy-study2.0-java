package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;
import org.springframework.beans.factory.annotation.Value;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class GradeVO extends BaseVO {

    private Integer gNo;

    @JsonProperty("gradeName")
    private String name;

    private String gradeType;

    private String gradeMasterId;

    private String gradeMasterName;

    private String enterStudyTime;

    private String endStudyTime;

    @Value("0")
    private Integer studentCount;

    @Value("0")
    private Integer teacherCount;

    @Value("0")
    private Integer clazzCount;

}
