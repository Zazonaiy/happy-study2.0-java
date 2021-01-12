package com.happystudy2.happystudy2management.domain.po.view;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Builder
@Table(name = "grade_info_view")
public class GradeInfoViewPO extends BasePO {
    @Column(name = "g_no")
    private Integer gNo;

    @Column(name = "name")
    private String name;

    @Column(name = "grade_type")
    private Integer gradeType;

    @Column(name = "grade_master_id")
    private String gradeMasterId;

    @Column(name = "grade_master_name")
    private String gradeMasterName;

    @Column(name = "enter_study_time")
    private String enterStudyTime;

    @Column(name = "end_study_time")
    private String endStudyTime;

    @Column(name = "student_count")
    private Integer studentCount;

    @Column(name = "teacher_count")
    private Integer teacherCount;

    @Column(name = "clazz_count")
    private Integer clazzCount;

}
