package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.EditTypeEnum;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.StudentEditDTO;
import com.happystudy2.happystudy2management.domain.dto.StudentImportDTO;
import com.happystudy2.happystudy2management.domain.po.StudentPO;
import com.happystudy2.happystudy2management.domain.po.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.StudentEditVO;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;

import java.util.List;

public interface StudentService {
    public ListResultVO listStudent(MetaData metaData);

    public StudentVO addStudent(StudentEditDTO studentEditDTO);

    public StudentVO updateStudent(StudentEditDTO studentEditDTO);

    public ResultCop deleteStudent (String ...ids);

    public List<StudentVO> pageHelperTest();

    public String addStudentBatch(List<StudentImportDTO> studentImportDTOListist);

}
