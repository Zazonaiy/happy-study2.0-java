package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SubjectTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.course.CourseMapper;
import com.happystudy2.happystudy2management.dao.subject.SubjectInfoViewMapper;
import com.happystudy2.happystudy2management.dao.subject.SubjectMapper;
import com.happystudy2.happystudy2management.domain.dto.SubjectEditDTO;
import com.happystudy2.happystudy2management.domain.po.course.CoursePO;
import com.happystudy2.happystudy2management.domain.po.subject.SubjectPO;
import com.happystudy2.happystudy2management.domain.po.subject.view.SubjectInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SubjectVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.service.CourseService;
import com.happystudy2.happystudy2management.service.SubjectService;
import com.happystudy2.happystudy2management.util.StringBussinessUtil;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private SubjectInfoViewMapper subjectInfoViewMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CourseService courseService;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;

    @Override
    public ListResultVO listSubject(MetaData metaData){
        Example example = new Example(SubjectInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeType"))){
                criteria.andEqualTo("gradeType", metaData.getFilter().get("gradeType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("subjectType"))){
                criteria.andEqualTo("subjectType", metaData.getFilter().get("subjectType"));
            }
        }

        if (Objects.nonNull(metaData) && (!metaData.getExt().isEmpty())){
            List<String> ext = metaData.getExt();
            String e = "%"+ext.get(0)+"%";
            if (!e.equals("")){
                criteria.andLike("name", e);
                criteria.orLike("subNo", e);
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
        PageInfo<SubjectInfoViewPO> pageInfo = new PageInfo<>(subjectInfoViewMapper.selectByExample(example));

        List<SubjectInfoViewPO> subjectInfoViewPOList = pageInfo.getList();

        List<SubjectVO> result = Lists.newArrayList();
        for (SubjectInfoViewPO subjectInfoViewPO : subjectInfoViewPOList){
            SubjectVO subjectVO = typeMapper.map(subjectInfoViewPO, SubjectVO.class);
            subjectVO.setSubjectType(TypeVO.builder().typeCode(subjectInfoViewPO.getSubjectType()).typeDescription(SubjectTypeEnum.descriptionOf(subjectInfoViewPO.getSubjectType())).build());
            result.add(subjectVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();
        return resultVO;
    }

    @Override
    public SubjectVO addSubject(SubjectEditDTO subjectEditDTO){
        SubjectPO subjectPO = typeMapper.map(subjectEditDTO, SubjectPO.class);

        Integer subNo = noGenerator.subjectNo(subjectPO);
        subjectPO.setSubNo(subNo);

        subjectMapper.insertSelective(subjectPO);
        return typeMapper.map(subjectPO, SubjectVO.class);
    }

    @Override
    public SubjectVO updateSubject(SubjectEditDTO subjectEditDTO){
        SubjectPO subjectPO = typeMapper.map(subjectEditDTO, SubjectPO.class);
        SubjectPO exist = subjectMapper.selectByPrimaryKey(subjectPO);

        subjectPO.setLastModifyTime(exist.getLastModifyTime());
        subjectPO.setSubNo(exist.getSubNo());

        subjectMapper.updateByPrimaryKeySelective(subjectPO);
        return typeMapper.map(subjectPO, SubjectVO.class);
    }

    @Transactional
    @Override
    public ResultCop deleteSubject(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        SubjectPO subjectExample = new SubjectPO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                subjectExample.setId(id);
                SubjectPO exist = subjectMapper.selectByPrimaryKey(subjectExample);
                if (Objects.isNull(exist)){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                Boolean coDelRes = this.deleteCourseBySubject(exist);
                if (!coDelRes){
                    throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "删除学科=>课程删除失败");
                }

                exist.setDeleted(true);
                subjectMapper.updateByPrimaryKey(exist);
                successCount++;
                index++;
            }
        } catch (Exception e){
            e.printStackTrace();
            res.setIsSuccess(ResultCop.FAILED);
            res.setDescription("error index: -" + index);
            res.setWarnTag(ResultCop.NOT_WARN);
            return res;
        }

        res.setIsSuccess(ResultCop.SUCCESS);
        res.setDescription("/r/n success: " + successCount + ", /r/n invalid: " + notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }
    private Boolean deleteCourseBySubject(SubjectPO subjectPO){
        List<CoursePO> subCourseList = getCourseListBySubject(subjectPO);
        if (subCourseList.isEmpty()){
            return true;
        }
        String ids = "";
        for (CoursePO coursePO : subCourseList){
            ids += coursePO.getId() + StringBussinessUtil.ID_SPLITE_FORMATE;
        }
        ResultCop resultCop = courseService.deleteCourse(StringBussinessUtil.splitIds(ids));

        return resultCop.getIsSuccess();
    }
    private List<CoursePO> getCourseListBySubject(SubjectPO subjectPO){
        String subjectId = subjectPO.getId();
        Example example = new Example(CoursePO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("subjectId", subjectId);

        return courseMapper.selectByExample(example);
    }

    @Override
    public List<SubjectVO> listSubjectByType(Integer subjectType){
        Example example = new Example(SubjectPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted" ,false);
        if (Objects.nonNull(subjectType)){
            criteria.andEqualTo("subjectType", subjectType);
        }

        List<SubjectPO> subjectPOList = subjectMapper.selectByExample(example);
        List<SubjectVO> result = Lists.newArrayList();
        for (SubjectPO subjectPO : subjectPOList){
            SubjectVO subjectVO = typeMapper.map(subjectPO, SubjectVO.class);
            subjectVO.setSubjectType(TypeVO.builder().typeCode(subjectPO.getSubjectType()).typeDescription(SubjectTypeEnum.descriptionOf(subjectPO.getSubjectType())).build());
            result.add(subjectVO);
        }

        return result;
    }

    @Override
    public TypeVO getSubjectTypeById(String subjectId){
        SubjectPO subjectPO = subjectMapper.selectByPrimaryKey(subjectId);
        Integer typeCode = subjectPO.getSubjectType();

        return TypeVO.builder().typeCode(typeCode).typeDescription(SubjectTypeEnum.descriptionOf(typeCode)).build();
    }
}
