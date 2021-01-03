package com.happystudy2.happystudy2management.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.google.common.collect.Maps;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.apache.commons.compress.utils.Lists;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;

@Data
@Builder
@ApiModel("元数据")
@AllArgsConstructor
@EqualsAndHashCode
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MetaData {

    /**
     * 分页
     */
    @ApiModelProperty("分页信息")
    private PaginationParam paginationParam;

    /**
     * 过滤信息
     */
    @ApiModelProperty("过滤信息")
    private Map<String, String> filter;

    @ApiModelProperty("扩展字段 搜索框模糊匹配用")
    private List<String> ext;

    public void MetaData(PaginationParam paginationParam){
        this.paginationParam = paginationParam;
        this.filter = Maps.newHashMap();
        this.ext = Lists.newArrayList();
    }

    public void Metadata(PaginationParam paginationParam, Map<String, String> filter){
        this.paginationParam = paginationParam;
        this.filter = filter;
        this.ext = Lists.newArrayList();
    }

    public void Metadata(PaginationParam paginationParam, Map<String, String> filter, List<String> ext){
        this.paginationParam = paginationParam;
        this.filter = filter;
        this.ext = ext;
    }
}
