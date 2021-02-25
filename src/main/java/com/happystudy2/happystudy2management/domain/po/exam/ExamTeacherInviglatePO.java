package com.happystudy2.happystudy2management.domain.po.exam;

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
@Table(name = "exam_teacher_inviglate")
public class ExamTeacherInviglatePO extends BasePO {

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "teacher_id")
    private String teacherId;

    @Column(name = "exam_subject_id")
    private String examSubjectId;

}
