package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.semester.SemesterMapper;
import com.happystudy2.happystudy2management.dao.semester.SemesterViewMapper;
import com.happystudy2.happystudy2management.domain.vo.SemesterVO;
import com.happystudy2.happystudy2management.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SemesterServiceImpl implements SemesterService {

    @Autowired
    private SemesterMapper semesterMapper;
    @Autowired
    private SemesterViewMapper semesterViewMapper;
    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<SemesterVO> listAll(){
        return typeMapper.mapList(semesterViewMapper.selectAll(), SemesterVO.class);
    }
}
