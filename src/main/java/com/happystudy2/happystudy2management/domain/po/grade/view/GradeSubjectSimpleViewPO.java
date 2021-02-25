package com.happystudy2.happystudy2management.domain.po.grade.view;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Builder
@Table(name = "grade_subject_simple_view")
public class GradeSubjectSimpleViewPO extends BasePO {

    @Column(name = "sub_no")
    private Integer subNo;

    @Column(name = "name")
    private String name;

    @Column(name = "subject_type")
    private Integer Subject_type;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;
}
