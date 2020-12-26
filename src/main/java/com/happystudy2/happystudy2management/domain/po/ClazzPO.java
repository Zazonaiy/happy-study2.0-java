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
@Table(name = "clazz")
public class ClazzPO extends BasePO {

    @Column(name = "cl_no")
    private String clNo;

    @Column(name = "name")
    private String name;

    @Column(name = "clazz_master_id")
    private String clazzMasterId;

    @Column(name = "grade_id")
    private String gradeId;
}
