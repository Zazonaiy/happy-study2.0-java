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
@Table(name = "lg_permission")
public class PermissionPO extends BasePO {

    @Column(name = "permission_name")
    private String permissionName;

    @Column(name = "description")
    private String description;

    @Column(name = "permission_type")
    private Integer permissionType;

    @Column(name = "url")
    private String url;
}
