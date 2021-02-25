package com.happystudy2.happystudy2management.domain.po.exam.view;

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
@Table(name = "exam_teacher_mar_info_view")
public class ExamTeacherMarInfoViewPO extends BasePO {

    @Column(name = "teacher_id")
    private String teacherId;

    @Column(name = "teacher_name")
    private String teacherName;

    @Column(name = "exam_subject_id")
    private String examSubjectId;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "exam_subject_name")
    private String examSubjectName;

    @Column(name = "exam_subject_begin_time")
    private String examSubjectBeginTime;

    @Column(name = "exam_subject_end_time")
    private String examSubjectEndTime;

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "exam_name")
    private String examName;

    @Column(name = "exam_state")
    private Integer examState;

    @Column(name = "exam_type")
    private Integer examType;
}
