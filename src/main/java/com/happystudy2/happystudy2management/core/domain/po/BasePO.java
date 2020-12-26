package com.happystudy2.happystudy2management.core.domain.po;

import com.happystudy2.happystudy2management.core.service.DefaultNextVersion;
import com.happystudy2.happystudy2management.core.service.UUIDGenerator;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.annotation.Version;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;


@Data
@MappedSuperclass
public abstract class BasePO {

    @Id
    @KeySql(genId = UUIDGenerator.class)
    @Column(name = "id")
    private Integer id;

    @Column(name = "create_user")
    private String createUser;

    @Column(name = "create_time")
    private String createTime;

    @Column(name = "last_modify_user")
    @Version(nextVersion = DefaultNextVersion.class)
    private String lastModifyUser;

    @Column(name = "last_modify_time")
    private String lastModifyTime;

    @Column(name = "deleted")
    private Boolean deleted;

    @Column(name = "remark")
    private String remark;
}
