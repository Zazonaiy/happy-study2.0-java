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
@Table(name = "exam_subject")
public class ExamSubjectPO extends BasePO {

    @Column(name = "name")
    private String name;

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "begin_time")
    private String beginTime;

    @Column(name = "end_time")
    private String endTime;
}
