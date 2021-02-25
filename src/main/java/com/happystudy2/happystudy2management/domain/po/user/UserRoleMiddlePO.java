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
@Table(name = "lg_user_role_middle")
public class UserRoleMiddlePO extends BasePO {
    @Column(name = "role_id")
    private String roleId;

    @Column(name = "user_id")
    private String userId;
}
