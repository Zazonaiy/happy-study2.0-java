package com.happystudy2.happystudy2management.domain.po.exam.score.view;

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
@Table(name = "exam_score_info_view")
public class ExamScoreInfoViewPO extends BasePO {

    @Column(name = "exam_sub_stu_id")
    private String subjectStudentId;

    @Column(name = "exam_teac_mar_id")
    private String examTeacherMarId;

    @Column(name = "exam_subject_id")
    private String examSubjectId;

    @Column(name = "score")
    private Double score;

    @Column(name = "student_id")
    private String studentId;

    @Column(name = "s_no")
    private Integer sNo;

    @Column(name = "student_name")
    private String studentName;

    @Column(name = "clazz_id")
    private String clazzId;

    @Column(name = "clazz_name")
    private String clazzName;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "subject_name")
    private String subjectName;

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "exam_name")
    private String examName;

    @Column(name = "exam_room_id")
    private String examRoomId;

    @Column(name = "mar_teacher_name")
    private String marTeacherName;

    @Column(name = "mar_teacher_id")
    private String marTeacherId;
}
