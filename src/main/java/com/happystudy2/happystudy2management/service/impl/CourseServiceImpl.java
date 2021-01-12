package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.GradeTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SubjectTypeEnum;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.*;
import com.happystudy2.happystudy2management.domain.dto.CourseEditDTO;
import com.happystudy2.happystudy2management.domain.po.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.CoursePO;
import com.happystudy2.happystudy2management.domain.po.SubjectPO;
import com.happystudy2.happystudy2management.domain.po.TeacherPO;
import com.happystudy2.happystudy2management.domain.po.view.CourseInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.CourseVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.service.CourseService;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private CourseInfoViewMapper courseInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;

    @Override
    public List<TeacherSimpleVO> listCourseAbleTeacher(){
        Example example = new Example(TeacherPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        List<TeacherPO> teacherPOList = teacherMapper.selectByExample(example);

        return typeMapper.mapList(teacherPOList, TeacherSimpleVO.class);
    }

    @Override
    public ListResultVO listCourse(MetaData metaData){
        Example example = new Example(CourseInfoViewPO.class);
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
                criteria.orLike("gNo", e);
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
        PageInfo<CourseInfoViewPO> pageInfo = new PageInfo<>(courseInfoViewMapper.selectByExample(example));

        List<CourseInfoViewPO> courseInfoViewPOList = pageInfo.getList();

        List<CourseVO> result = Lists.newArrayList();
        for (CourseInfoViewPO courseInfoViewPO : courseInfoViewPOList){
            CourseVO courseVO = typeMapper.map(courseInfoViewPO, CourseVO.class);
            courseVO.setGradeType(TypeVO.builder().typeCode(courseInfoViewPO.getGradeType()).typeDescription(GradeTypeEnum.descriptionOf(courseInfoViewPO.getGradeType())).build());
            courseVO.setSubjectType(TypeVO.builder().typeCode(courseInfoViewPO.getSubjectType()).typeDescription(SubjectTypeEnum.descriptionOf(courseInfoViewPO.getSubjectType())).build());
            result.add(courseVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());
        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }

    @Override
    public CourseVO addCourse(CourseEditDTO courseEditDTO){
        CoursePO coursePO = typeMapper.map(courseEditDTO, CoursePO.class);
        SubjectPO subjectPO = subjectMapper.selectByPrimaryKey(coursePO.getSubjectId());
        ClazzPO clazzPO = clazzMapper.selectByPrimaryKey(coursePO.getClazzId());

        coursePO.setName(subjectPO.getName() + " " + clazzPO.getName());
        Integer coNo = noGenerator.courseNo(subjectPO, clazzPO);
        coursePO.setCoNo(coNo);

        courseMapper.insertSelective(coursePO);
        return typeMapper.map(coursePO, CourseVO.class);
    }

    @Override
    public CourseVO updateCourse(CourseEditDTO courseEditDTO){
        CoursePO coursePO = typeMapper.map(courseEditDTO, CoursePO.class);
        CoursePO exist = courseMapper.selectByPrimaryKey(coursePO);

        coursePO.setLastModifyTime(exist.getLastModifyTime());
        coursePO.setCoNo(exist.getCoNo());

        courseMapper.updateByPrimaryKeySelective(coursePO);
        coursePO.setCoNo(exist.getCoNo());
        coursePO.setName(exist.getName());
        return typeMapper.map(coursePO, CourseVO.class);
    }

    @Transactional
    @Override
    public ResultCop deleteCourse(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        CoursePO courseExample = new CoursePO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                courseExample.setId(id);
                CoursePO exist = courseMapper.selectByPrimaryKey(courseExample);
                if (Objects.isNull(exist)){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                exist.setDeleted(true);
                courseMapper.updateByPrimaryKey(exist);
                successCount++;
                index++;
            }
        }catch (Exception e){
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
}
