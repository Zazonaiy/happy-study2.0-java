package com.happystudy2.happystudy2management.domain.dto.noGenerator;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Data
@Builder
public class ExamRoomNoSimpleDTO {

    private Integer examRoomNo;

    private Integer count;
}
