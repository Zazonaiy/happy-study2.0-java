package com.happystudy2.happystudy2management.domain.po.user.view;

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
@Table(name = "lg_role_permission_view")
public class RolePermissionViewPO extends BasePO {

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "role_type")
    private String roleType;

    @Column(name = "role_description")
    private String roleDescription;

    @Column(name = "permission_id")
    private String permissionId;

    @Column(name = "permission_name")
    private String permissionName;

    @Column(name = "permission_type")
    private Integer permissionType;

    @Column(name = "permission_description")
    private String permissionDescription;

    @Column(name = "url")
    private String url;
}
