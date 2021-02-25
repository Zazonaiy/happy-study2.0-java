package com.happystudy2.happystudy2management.domain.vo.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamVO extends BaseVO {

    private Integer eNo;

    @JsonProperty("examName")
    private String name;

    private TypeVO examType;

    private TypeVO examState;

    private String gradeId;

    private String gradeName;

    private String semesterId;

    private String semesterName;

    private String beginDate;

    private String endDate;

    private Integer studentCount;

    private Integer teacherCount;

    private Integer roomCount;

    private Integer subjectCount;
}
