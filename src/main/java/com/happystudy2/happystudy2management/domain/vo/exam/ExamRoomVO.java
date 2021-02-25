package com.happystudy2.happystudy2management.domain.vo.exam;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamRoomVO extends BaseVO {

    private Integer roomNo;

    private String roomPlace;

    private String roomName;

    private Boolean differentPlaceTag;
    private String differentPlaceRemark;

    private Boolean rentTag;
    private String rentGradeId;
    private String rentGradeName;
    private TypeVO rentState;

    private Integer maxSize;
}
