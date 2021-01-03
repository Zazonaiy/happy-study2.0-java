package com.happystudy2.happystudy2management.core.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.validation.constraints.Min;

@Data
@Builder
@ApiModel
@NoArgsConstructor
@AllArgsConstructor
public class PaginationParam {

    /**
     * 当前页
     */
    @NonNull
    @Min(value = 1, message = "最小为第一页")
    @ApiModelProperty("当前页")
    private Integer page;

    /**
     * 每页数量
     */
    @NonNull
    @Min(value = 1, message = "每页最小大小值为1")
    @ApiModelProperty("每页大小")
    private Integer pageSize;

    @ApiModelProperty("根据什么排序")
    private String orderBy;

    @ApiModelProperty("升序asc 降序desc")
    private String orderWay;

    @ApiModelProperty("总记录数")
    private Long totalCount;

    @ApiModelProperty("分页后有多少页")
    private Integer pageCount;
}
