package com.happystudy2.happystudy2management.domain.vo;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class StudentSimpleVO extends BaseVO {

    private String name;

    private String sNo;
}
