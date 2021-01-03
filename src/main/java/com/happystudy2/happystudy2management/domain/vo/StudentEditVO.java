package com.happystudy2.happystudy2management.domain.vo;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class StudentEditVO extends BaseVO {

    private StudentVO student;

    private List<GradeVO> gradeList;

    private List<ClazzVO> clazzList;

}
