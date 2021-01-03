package com.happystudy2.happystudy2management.core.domain.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import javax.persistence.MappedSuperclass;
import java.util.Date;

@Data
//@MappedSuperclass
@ApiModel("DTO超类")
//@SuperBuilder
//@AllArgsConstructor
//@NoArgsConstructor
public abstract class BaseDTO {
    private String id;
    private String createUser;
    private String createTime;
    private Date lastModifyUser;
    private Date lastModifyTime;
    private Boolean deleted;
    private String remark;
}
