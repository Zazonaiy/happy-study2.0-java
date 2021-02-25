package com.happystudy2.happystudy2management.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@Builder
@ApiModel("返回前端的数据")
@EqualsAndHashCode
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResultData <T extends BaseVO> {
    private List<T> resData;

    private List<Object> extData;

    private Integer state;

    private String description;

}
