package com.happystudy2.happystudy2management.domain.po;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "student")
public class StudentPO extends BasePO {

    @Column(name = "s_no")
    private Integer sNo;

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

    @Column(name = "clazz_master_id")
    private String clazzMasterId;

    @Column(name = "clazz_id")
    private String clazzId;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "father_phone")
    private String fatherPhone;

    @Column(name = "mother_name")
    private String motherName;

    @Column(name = "mother_phone")
    private String motherPhone;

    @Column(name = "em_contact_name")
    private String emContactName;

    @Column(name = "em_contact_phone")
    private String emContactPhone;
}
