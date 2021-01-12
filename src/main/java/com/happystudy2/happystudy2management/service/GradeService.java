package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.GradeEditDTO;
import com.happystudy2.happystudy2management.domain.po.GradePO;
import com.happystudy2.happystudy2management.domain.vo.GradeVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;

import java.util.List;

public interface GradeService {

    public List<GradeVO> listAll();

    public List<GradeVO> listByGradeType(Integer gradeType);

    public ListResultVO listGrade(MetaData metaData);

    public List<TeacherSimpleVO> listGradeMasterAbleTeacher();

    public GradeVO addGrade(GradeEditDTO gradeEditDTO);

    public GradeVO updateGrade(GradeEditDTO gradeEditDTO);

    public ResultCop deleteGrade(String ...ids);


}
