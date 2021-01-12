package com.happystudy2.happystudy2management.domain.po.view;

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
@Table(name = "course_info_view")
public class CourseInfoViewPO extends BasePO {

    @Column(name = "co_no")
    private Integer coNo;

    @Column(name = "name")
    private String name;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "subject_name")
    private String subjectName;

    @Column(name = "subject_type")
    private Integer subjectType;

    @Column(name = "teacher_id")
    private String teacherId;

    @Column(name = "teacher_name")
    private String teacherName;

    @Column(name = "clazz_id")
    private String clazzId;

    @Column(name = "clazz_name")
    private String clazzName;

    @Column(name = "clazz_type")
    private Integer clazzType;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;

    @Column(name = "grade_type")
    private Integer gradeType;

    @Column(name = "student_count")
    private Integer studentCount;



}
