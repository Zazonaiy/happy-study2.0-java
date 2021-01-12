package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class CourseVO extends BaseVO {

    private Integer coNo;

    @JsonProperty("courseName")
    private String name;

    private String clazzId;

    private String clazzName;

    private String clazzMasterId;

    private String clazzMasterName;

    private String teacherId;

    private String teacherName;

    private String gradeId;

    private String gradeName;

    private TypeVO gradeType;

    private String gradeMasterId;

    private String gradeMasterName;

    private String subjectId;

    private String subjectName;

    private TypeVO subjectType;

    private Integer studentCount;
}
