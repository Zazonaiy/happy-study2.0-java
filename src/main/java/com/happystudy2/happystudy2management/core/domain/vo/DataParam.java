package com.happystudy2.happystudy2management.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@Builder
@ApiModel("一般数据参数")
@EqualsAndHashCode
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DataParam {
    private List<Object> datas;
}
