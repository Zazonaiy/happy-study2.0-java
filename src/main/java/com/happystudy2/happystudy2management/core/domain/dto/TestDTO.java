package com.happystudy2.happystudy2management.core.domain.dto;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@ApiModel("元数据测试")
public class TestDTO {

    private Integer page;

    private Integer pageSize;

    private String orderBy;

    private String orderWay;

    private Long totalCount;
}
