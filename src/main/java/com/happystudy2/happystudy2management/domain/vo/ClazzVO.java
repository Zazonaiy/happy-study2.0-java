package com.happystudy2.happystudy2management.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.TypeAble;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ClazzVO extends BaseVO implements TypeAble {

    private Integer clNo;

    @JsonProperty("clazzName")
    private String name;

    private String clazzMasterId;

    private String clazzMasterName;

    private String gradeId;

    private String gradeName;

    private TypeVO gradeType;

    private TypeVO clazzType;

    private String gradeMasterId;

    private String gradeMasterName;

    private Integer studentCount;

    @Override
    public TypeVO getTypeVO() {
        return this.gradeType;
    }

    @Override
    public void setTypeVO(TypeVO typeVO) {
        this.gradeType = typeVO;
    }
}
