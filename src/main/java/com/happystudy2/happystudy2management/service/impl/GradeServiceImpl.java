package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.GradeTypeEnum;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.GradeMapper;
import com.happystudy2.happystudy2management.domain.po.GradePO;
import com.happystudy2.happystudy2management.domain.vo.GradeVO;
import com.happystudy2.happystudy2management.service.GradeService;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private TypeMapper typeMapper;


    @Override
    public List<GradeVO> listAll() {
        List<GradePO> gradePOList = gradeMapper.selectAll();
        List<GradeVO> result = Lists.newArrayList();
        for (GradePO gradePO : gradePOList){
            GradeVO gradeVO = typeMapper.map(gradePO, GradeVO.class);
            gradeVO.setGradeType(GradeTypeEnum.descriptionOf(gradePO.getGradeType()));
            result.add(gradeVO);
        }
        return result;
    }
}
