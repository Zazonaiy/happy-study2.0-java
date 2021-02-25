package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.ClazzEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ClazzVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;

import java.util.List;

public interface ClazzService {

    List<ClazzVO> listAll();

    List<ClazzVO> listByGrade(String gradeId);

    ListResultVO listClazz(MetaData metaData);

    ClazzVO addClazz(ClazzEditDTO clazzEditDTO);

    ClazzVO updateClazz(ClazzEditDTO clazzEditDTO);

    ResultCop deleteClazz(String ...ids);

    List<TeacherSimpleVO> listClazzMasterAbleTeacher();

}
