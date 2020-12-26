package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.domain.po.StudentPO;
import com.happystudy2.happystudy2management.domain.po.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;

import java.util.List;

public interface StudentService {
    public List<StudentPO> test();
    public List<StudentInfoViewPO> test2();
    public List<StudentVO> listStudent();
}
