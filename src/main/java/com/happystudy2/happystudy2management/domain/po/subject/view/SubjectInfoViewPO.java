package com.happystudy2.happystudy2management.domain.po.subject.view;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Builder
@Table(name = "subject_info_view")
public class SubjectInfoViewPO extends BasePO {

    @Column(name = "sub_no")
    private Integer subNo;

    @Column(name = "name")
    private String name;

    @Column(name = "subject_type")
    private Integer subjectType;
}
