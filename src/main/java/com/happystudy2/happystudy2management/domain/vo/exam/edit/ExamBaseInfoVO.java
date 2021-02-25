package com.happystudy2.happystudy2management.domain.vo.exam.edit;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.SemesterVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamBaseInfoVO extends BaseVO {

    private String name ;

    private SemesterVO semester;

    private TypeVO examType;

    private SimpleVO grade;

    private String beginTime;

    private String endTime;

    private String remark;


}
