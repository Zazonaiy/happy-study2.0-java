package com.happystudy2.happystudy2management.core.domain.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import javax.persistence.MappedSuperclass;

@Data
@MappedSuperclass
@ApiModel("DTO超类")
@SuperBuilder
@AllArgsConstructor
@EqualsAndHashCode
public class BaseDTO {
    private Integer id;
    private String createUser;
    private String createTime;
    private String lastModifyUser;
    private String lastModifyTime;
    private Boolean deleted;
    private String remark;
}
