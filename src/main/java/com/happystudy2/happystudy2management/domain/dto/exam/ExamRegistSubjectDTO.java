package com.happystudy2.happystudy2management.domain.dto.exam;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ExamRegistSubjectDTO extends BaseDTO {

    private String examId;

    private String subjectId;

    private String beginTime;

    private String endTime;


}
