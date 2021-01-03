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
@Table(name = "teacher")
public class TeacherPO extends BasePO {

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

    @Column(name = "grade_id")
    private String gradeId;

    @Column(name = "grade_master_id")
    private String gradeMasterId;

    @Column(name = "next_id")
    private String nextId;
}
