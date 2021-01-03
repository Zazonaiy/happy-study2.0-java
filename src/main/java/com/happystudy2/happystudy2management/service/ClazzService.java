package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.domain.po.ClazzPO;
import com.happystudy2.happystudy2management.domain.vo.ClazzVO;

import java.util.List;

public interface ClazzService {

    public List<ClazzVO> listAll();

    public List<ClazzVO> listByGrade(String gradeId);
}
