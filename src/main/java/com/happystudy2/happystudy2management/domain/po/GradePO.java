package com.happystudy2.happystudy2management.domain.po;

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
@Table(name = "grade_team")
public class GradePO extends BasePO {

    @Column(name = "name")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "grade_master_id")
    private String gradeMasterId;

    @Column(name = "enter_study_time")
    private String enterStudyTime;

    @Column(name = "end_study_time")
    private String endStudyTime;
}
