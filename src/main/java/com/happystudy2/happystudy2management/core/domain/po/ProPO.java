package com.happystudy2.happystudy2management.core.domain.po;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@Data
@MappedSuperclass
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Builder
public class ProPO extends BasePO {

    @Column(name = "applicant_id")
    private String applicantId;

    @Column(name = "applicant_type")
    private Integer applicantType;

    @Column(name = "approval_by_id")
    private String approvalById;

    @Column(name = "approval_by_type")
    private Integer approvalByType;

    @Column(name = "launch_date")
    private String launchDate;

    @Column(name = "dead_date")
    private String deadDate;

    @Column(name = "pro_state")
    private Integer proState;

    @Column(name = "opinion")
    private Integer opinion;
}
