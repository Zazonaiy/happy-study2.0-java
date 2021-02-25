package com.happystudy2.happystudy2management.domain.po.user;

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
@Table(name = "lg_role")
public class RolePO extends BasePO {

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "role_type")
    private Integer roleType;

    @Column(name = "description")
    private String description;

}
