package com.happystudy2.happystudy2management.domain.vo;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.PaginationParam;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ListResultVO extends BaseVO {

    private List<? extends BaseVO> resList;

    private PaginationParam paginationParam;
    //private Long totalCount;

    //private Integer page;

    //private Integer pageSize;
}
