package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ScoreTypeEnum;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.exam.ExamScoreMapper;
import com.happystudy2.happystudy2management.dao.exam.view.ExamScoreInfoViewMapper;
import com.happystudy2.happystudy2management.dao.exam.view.ExamSubjectStudentInfoViewMapper;
import com.happystudy2.happystudy2management.domain.dto.score.ScoreEditDTO;
import com.happystudy2.happystudy2management.domain.po.exam.score.ExamScorePO;
import com.happystudy2.happystudy2management.domain.po.exam.score.view.ExamScoreInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.exam.view.ExamSubjectStudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.grade.view.GradeInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreEditVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreVO;
import com.happystudy2.happystudy2management.service.ScoreService;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

@Service
public class ScoreServiceImpl implements ScoreService {
    @Autowired
    private ExamScoreMapper scoreMapper;
    @Autowired
    private ExamSubjectStudentInfoViewMapper subjectStudentInfoViewMapper;
    @Autowired
    private ExamScoreInfoViewMapper examScoreInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;

    @Override
    public ListResultVO listScore(MetaData metaData, String examId){
        Example example = new Example(ExamScoreInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtils.isNotBlank(examId)){
            criteria.andEqualTo("examId", examId);
        }
        if (Objects.nonNull(metaData) && Objects.nonNull(metaData.getFilter())) {
            if (StringUtils.isNotBlank(metaData.getFilter().get("scoreType"))){
                criteria.andGreaterThanOrEqualTo("score", metaData.getFilter().get("scoreType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("clazzId"))){
                criteria.andEqualTo("clazzId", metaData.getFilter().get("clazzId"));
            }
        }

        if (Objects.nonNull(metaData) && (!metaData.getExt().isEmpty())){
            List<String> ext = metaData.getExt();
            String e = "%"+ext.get(0)+"%";
            if (!e.equals("")){
                criteria.andLike("studentName", e);
                criteria.orLike("sNo", e);
            }
        }

        String orderBy = metaData.getPaginationParam().getOrderBy();
        String orderWay = metaData.getPaginationParam().getOrderWay();

        if (Objects.isNull(orderBy)){
            orderBy = "";
        }
        if (Objects.nonNull(orderWay) && StringUtils.isNotBlank(orderBy)){
            if (orderWay.equalsIgnoreCase("desc")){
                example.orderBy(orderBy).desc();
            }else {
                example.orderBy(orderBy).asc();
            }
        }
        PageHelper.startPage(metaData.getPaginationParam().getPage(), metaData.getPaginationParam().getPageSize());
        PageInfo<ExamScoreInfoViewPO> pageInfo = new PageInfo<>(examScoreInfoViewMapper.selectByExample(example));

        List<ExamScoreInfoViewPO> scoreInfoViewPOList = pageInfo.getList();

        List<ExamScoreVO> result = Lists.newArrayList();
        for (ExamScoreInfoViewPO examScoreInfoViewPO : scoreInfoViewPOList){
            ExamScoreVO examScoreVO = typeMapper.map(examScoreInfoViewPO, ExamScoreVO.class);
            examScoreVO.setScoreType(TypeVO.builder().typeDescription(ScoreTypeEnum.getType(examScoreInfoViewPO.getScore()).getDescription()).typeCode(ScoreTypeEnum.getType(examScoreInfoViewPO.getScore()).getCode()).build());
            result.add(examScoreVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;

    }

    @Override
    public ExamScoreEditVO addScore(ScoreEditDTO scoreEditDTO) {
        //TODO:
        String examSubjectId = scoreEditDTO.getExamSubjectId();
        String marTeacherId = scoreEditDTO.getExamTeacMarId();
        String subjectStudentId = scoreEditDTO.getExamSubStuId();


        Example example = new Example(ExamScorePO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("examSubjectId", examSubjectId);
        //criteria.andEqualTo("examTeacMarId", marTeacherId);
        criteria.andEqualTo("subjectStudentId", subjectStudentId);

        ExamScorePO select = scoreMapper.selectOneByExample(example);

        select.setScore(scoreEditDTO.getScore());
        //TODO:
        select.setMarkingTeacherId("todo");
        //select.setMarkingTeacherId(scoreEditDTO.getExamTeacMarId());

        scoreMapper.updateByPrimaryKeySelective(select);
        return typeMapper.map(select, ExamScoreEditVO.class);
    }

    @Override
    public ExamScoreEditVO updateScore(ScoreEditDTO scoreEditDTO) {
        //TODO:
        return null;
    }

    @Override
    public List<SimpleVO> listSubjectStudentWithoutScore(String examSubjectId){
        Example example = new Example(ExamSubjectStudentInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("examSubjectId", examSubjectId);

        List<ExamSubjectStudentInfoViewPO> subjectStudentInfoViewPOS = subjectStudentInfoViewMapper.selectByExample(example);
        List<SimpleVO> result = Lists.newArrayList();
        for (ExamSubjectStudentInfoViewPO subjectStudentInfoViewPO : subjectStudentInfoViewPOS){
            SimpleVO simpleVO = typeMapper.map(subjectStudentInfoViewPO, SimpleVO.class);
            simpleVO.setName(subjectStudentInfoViewPO.getStudentName());
            result.add(simpleVO);
        }

        return result;


    }
}
