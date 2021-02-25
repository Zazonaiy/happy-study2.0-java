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
@Table(name = "exam_info_view")
public class ExamInfoViewPO extends BasePO {

    @Column(name = "e_no")
    private Integer eNo;

    @Column(name = "exam_name")
    private String name;

    @Column(name = "exam_type")
    private Integer examType;

    @Column(name = "semester_id")
    private String semesterId;

    @Column(name = "semester_name")
    private String semesterName;

    @Column(name = "exam_state")
    private Integer examState;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;

    @Column(name = "begin_date")
    private String beginDate;

    @Column(name = "end_date")
    private String endDate;

    @Column(name = "student_count")
    private Integer studentCount;

    @Column(name = "room_count")
    private Integer roomCount;
}
