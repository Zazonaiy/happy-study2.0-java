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
@Table(name = "teacher_info_view")
public class TeacherInfoViewPO extends BasePO {

    @Column(name = "t_no")
    private Integer tNo;

    @Column(name = "name")
    private String name;

    @Column(name = "sex")
    private Integer sex;

    @Column(name = "birthday")
    private String birthday;

    @Column(name = "member_type")
    private Integer memberType;

    @Column(name = "resp_type")
    private Integer respType;

    @Column(name = "is_clazz_master")
    private Boolean isClazzMaster;

    @Column(name = "is_grade_master")
    private Boolean isGradeMaster;

    @Column(name = "is_school_master")
    private Boolean isSchoolMaster;

    @Column(name = "next_id")
    private String nextId;

    @Column(name = "resp_clazz_id")
    private String respClazzId;

    @Column(name = "resp_clazz_no")
    private Integer respClazzNo;

    @Column(name = "resp_clazz_name")
    private String respClazzName;

    @Column(name = "resp_clazz_type")
    private Integer respClazzType;

    @Column(name = "resp_grade_id")
    private String respGradeId;

    @Column(name = "resp_grade_no")
    private Integer respGradeNo;

    @Column(name = "resp_grade_name")
    private String respGradeName;

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_name")
    private String gradeName;

    @Column(name = "grade_master_id")
    private String gradeMasterId;

    @Column(name = "grade_type")
    private Integer gradeType;

}
