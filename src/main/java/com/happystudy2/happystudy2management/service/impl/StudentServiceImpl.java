package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SexEnum;
import com.happystudy2.happystudy2management.dao.StudentInfoViewMapper;
import com.happystudy2.happystudy2management.dao.StudentMapper;
import com.happystudy2.happystudy2management.domain.po.StudentPO;
import com.happystudy2.happystudy2management.domain.po.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;
import com.happystudy2.happystudy2management.service.StudentService;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.util.TimeUtil;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentInfoViewMapper studentInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;

    public List<StudentPO> test(){
        return studentMapper.selectAll();

    }
    public List<StudentInfoViewPO> test2(){
        return studentInfoViewMapper.selectAll();
    }

    @Override
    public List<StudentVO> listStudent() {
        List<StudentInfoViewPO> studentInfoViewPOList = studentInfoViewMapper.selectAll();
        //List<StudentVO> result =typeMapper.mapList(studentInfoViewPOList, StudentVO.class);
        List<StudentVO> result = Lists.newArrayList();
        for (StudentInfoViewPO studentInfoViewPO : studentInfoViewPOList){
            StudentVO studentVO = typeMapper.map(studentInfoViewPO, StudentVO.class);
            studentVO.setSex(SexEnum.sexOf(studentInfoViewPO.getSex()));
            studentVO.setAge(TimeUtil.mapAge(studentInfoViewPO.getBirthday()));
            result.add(studentVO);
        }
        return result;
    }
}
