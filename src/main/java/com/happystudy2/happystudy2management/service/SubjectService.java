package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.SubjectEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SubjectVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;

import java.util.List;

public interface SubjectService {

    ListResultVO listSubject(MetaData metaData);

    SubjectVO addSubject(SubjectEditDTO subjectEditDTO);

    SubjectVO updateSubject(SubjectEditDTO subjectEditDTO);

    List<SubjectVO> listSubjectByType(Integer subjectType);

    TypeVO getSubjectTypeById(String subjectId);

    ResultCop deleteSubject(String ...ids);
}
