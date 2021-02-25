package com.happystudy2.happystudy2management.domain.vo.exam.edit;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ExamSubjectConfigVO extends BaseVO {

    private String beginTime;

    private String endTime;

    private String name;

}
