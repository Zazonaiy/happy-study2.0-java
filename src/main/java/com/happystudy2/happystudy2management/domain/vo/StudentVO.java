package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class StudentVO extends BaseVO {

    private Integer sNo;

    private String name;

    private String sex;

    private Integer age;

    private String clazzId;

    private String clazzName;

    private String clazzMasterId;

    private String clazzMasterName;

    private String gradeId;

    private String gradeName;

    private String gradeMasterId;

    private String gradeMasterName;

}
