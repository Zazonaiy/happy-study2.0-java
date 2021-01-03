package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.ClazzMapper;
import com.happystudy2.happystudy2management.domain.po.ClazzPO;
import com.happystudy2.happystudy2management.domain.vo.ClazzVO;
import com.happystudy2.happystudy2management.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private TypeMapper typeMapper;


    @Override
    public List<ClazzVO> listAll() {
        return null;
    }

    @Override
    public List<ClazzVO> listByGrade(String gradeId) {
        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gradeId);
        List<ClazzPO> clazzPOList = clazzMapper.selectByExample(example);

        return typeMapper.mapList(clazzPOList, ClazzVO.class);
    }
}
