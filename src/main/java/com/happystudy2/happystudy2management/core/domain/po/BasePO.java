package com.happystudy2.happystudy2management.core.domain.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.SuperBuilder;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@Data
@MappedSuperclass
@SuperBuilder
@AllArgsConstructor
public class BasePO {

    @Column(name = "id")
    private Integer id;

    @Column(name = "create_user")
    private String createUser;

    @Column(name = "create_time")
    private String createTime;

    @Column(name = "last_modify_user")
    private String lastModifyUser;

    @Column(name = "last_modify_time")
    private String lastModifyTime;

    @Column(name = "deleted")
    private Boolean deleted;

    @Column(name = "remark")
    private String remark;
}
