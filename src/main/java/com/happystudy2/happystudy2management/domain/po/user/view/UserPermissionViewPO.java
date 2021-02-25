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
@Table(name = "lg_user_permission_view")
public class UserPermissionViewPO extends BasePO {

    @Column(name = "username")
    private String username;

    @Column(name = "member_type")
    private String memberType;

    @Column(name = "member_id")
    private String memberId;

    @Column(name = "phonenum")
    private String phone;

    @Column(name = "vxnum")
    private String vx;

    @Column(name = "role_id")
    private String roleId;

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "permission_id")
    private String permissionId;

    @Column(name = "permission_name")
    private String permissionName;

    @Column(name = "permission_description")
    private String permissionDescription;

    @Column(name = "permission_type")
    private Integer permissionType;

    @Column(name = "url")
    private String url;
}
