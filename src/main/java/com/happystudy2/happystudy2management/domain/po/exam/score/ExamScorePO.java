package com.happystudy2.happystudy2management.domain.po.exam.score;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "exam_score")
public class ExamScorePO extends BasePO {

    @Column(name = "exam_sub_stu_id")
    private String subjectStudentId;

    @Column(name = "exam_teac_mar_id")
    private String markingTeacherId;

    @Column(name = "exam_subject_id")
    private String examSubjectId;

    @Column(name = "score")
    private Double score;
}
