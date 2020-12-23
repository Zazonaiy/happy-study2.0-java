package com.happystudy2.happystudy2management.core.domain.vo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.SuperBuilder;

import javax.persistence.MappedSuperclass;

@Data
@MappedSuperclass
@ApiModel("VO超类")
@SuperBuilder
@AllArgsConstructor
@EqualsAndHashCode
public class BaseVO {
    private Integer id;
    private String createUser;
    private String createTime;
    private String lastModifyUser;
    private String lastModifyTime;
    private Boolean deleted;
    private String remark;
}
