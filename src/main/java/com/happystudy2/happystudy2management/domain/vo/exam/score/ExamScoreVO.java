package com.happystudy2.happystudy2management.domain.vo.exam.score;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamScoreVO extends BaseVO {

    private String subjectStudentId;

    private String examTeacherMarId;

    private String examSubjectId;

    private Double score;

    private String studentId;

    private Integer sNo;

    private String studentName;

    private String clazzId;

    private String clazzName;

    private String gradeId;

    private String gradeName;

    private String subjectId;

    private String subjectName;

    private String examId;

    private String examName;

    private String examRoomId;

    private String marTeacherName;

    private String marTeacherId;

    private Integer ranking;//TODO: 排名

    //优良差
    private TypeVO scoreType;
}
