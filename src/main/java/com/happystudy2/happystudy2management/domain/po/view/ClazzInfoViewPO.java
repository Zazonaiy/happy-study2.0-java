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
@Table(name = "clazz_info_view")
public class ClazzInfoViewPO extends BasePO {

    @Column(name = "cl_no")
    private Integer clNo;

    @Column(name = "name")
    private String name;

    @Column(name = "clazz_master_id")
    private String clazzMasterId;

    @Column(name = "clazz_master_name")
    private String clazzMasterName;

    @Column(name = "clazz_type")
    private Integer clazzType;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;

    @Column(name = "grade_type")
    private Integer gradeType;

    @Column(name = "grade_master_id")
    private String gradeMasterId;

    @Column(name = "grade_master_name")
    private String gradeMasterName;

    @Column(name = "student_count")
    private Integer studentCount;
}
