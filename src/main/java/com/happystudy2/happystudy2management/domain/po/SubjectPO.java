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
@Table(name = "subject")
public class SubjectPO extends BasePO {

    @Column(name = "sub_no")
    private Integer subNo;

    @Column(name = "name")
    private String name;

    @Column(name = "subject_type")
    private Integer subjectType;
}
