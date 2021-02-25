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
@Table(name = "lg_user")
public class UserPO extends BasePO {
    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "password_salt")
    private String passwordSalt;

    @Column(name = "member_id")
    private String memberId;

    @Column(name = "member_type")
    private Integer memberType;

    @Column(name = "phonenum")
    private String phone;

    @Column(name = "vxnum")
    private String vx;

    public String getCredentialsSalt(){
        return this.username+this.passwordSalt;
    }
}
