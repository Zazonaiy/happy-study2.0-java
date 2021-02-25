package com.happystudy2.happystudy2management.domain.vo.exam;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamSimpleVO extends BaseVO {

    private Integer eNo;

    private String name;

    private Integer examState;

    private String gradeId;

    private String lastModifyTime;

    private Integer stepCount;
}
