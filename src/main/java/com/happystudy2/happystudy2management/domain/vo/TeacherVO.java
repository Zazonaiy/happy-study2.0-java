package com.happystudy2.happystudy2management.domain.vo;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class TeacherVO extends BaseVO {

    private Integer tNo;

    private String name;

    private String sex;

    private Integer age;

    private TypeVO teacherType;

    private String gradeId;

    private String gradeName;

    private String gradeMasterId;

    private String gradeMasterName;

    private String gradeType;

    private List<ObjSimpleVO> courseList;

    private Integer courseCount;

    private ObjSimpleVO respClazz;

    private ObjSimpleVO respGrade;


}
