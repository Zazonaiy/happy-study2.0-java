package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.TeacherEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherVO;

public interface TeacherService {

    ListResultVO listTeacher(MetaData metaData);

    TeacherVO addTeacher(TeacherEditDTO teacherEditDTO);

    TeacherVO updateTeacher(TeacherEditDTO teacherEditDTO);

    ResultCop deleteTeacher(String ...ids);
}
