package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ClazzVO extends BaseVO {

    private Integer clNo;

    @JsonProperty("clazzName")
    private String name;

    private String clazzMasterId;

    private String clazzMasterName;

    private String gradeId;

    private String gradeName;

    private Integer StudentCount;
}
