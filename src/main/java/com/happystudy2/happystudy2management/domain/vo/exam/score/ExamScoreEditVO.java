package com.happystudy2.happystudy2management.domain.vo.exam.score;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamScoreEditVO extends BaseVO {

    private Integer score;

    private String examSubjectId;
    private String examSubjectName;

    private String examSubStuId;
    private String examSubStuName;

    private String examTeacMarId;
    private String examTeacMarName;

    private String userName;


    //TODO: 排名和成绩分类
}
