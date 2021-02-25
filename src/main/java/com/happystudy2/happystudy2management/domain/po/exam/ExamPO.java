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
@Table(name = "exam")
public class ExamPO extends BasePO {

    @Column(name = "e_no")
    private Integer eNo;

    @Column(name = "exam_name")
    private String name;

    @Column(name = "exam_type")
    private Integer examType;

    @Column(name = "semester_id")
    private String semesterId;

    @Column(name = "exam_state")
    private Integer examState;

    @Column(name = "create_progress")
    private Integer createProgress;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "begin_date")
    private String beginDate;

    @Column(name = "end_date")
    private String endDate;
}
