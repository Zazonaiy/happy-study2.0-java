package com.happystudy2.happystudy2management.domain.vo.exam;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamSubjectVO extends BaseVO {

    private String examId;
    private String examName;
    private TypeVO examState;

    private String subjectId;
    private String subjectName;

    private String beginTime;

    private String endTime;
}
