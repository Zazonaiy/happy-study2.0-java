package com.happystudy2.happystudy2management.domain.vo.exam.edit;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamRoomConfigVO extends BaseVO {

    private Boolean useOurGradeRoom;

    private Boolean rentTag;

    private Boolean otherElse;

    private Integer maxSize;

    private String rentGradeId;

    private String rentRemark;

    private String differentPlaceRemark;

    private String useVirtualRoomNo;
}
