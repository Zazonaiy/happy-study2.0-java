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
@Table(name = "exam_subject_info_view")
public class ExamSubjectInfoPO extends BasePO {

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "exam_name")
    private String examName;

    @Column(name = "exam_state")
    private Integer examState;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "subject_name")
    private String subjectName;

    @Column(name = "begin_time")
    private String beginTime;

    @Column(name = "end_time")
    private String endTime;

}
