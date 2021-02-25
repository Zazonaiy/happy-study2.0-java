package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ClazzTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.GradeTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzInfoViewMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzMapper;
import com.happystudy2.happystudy2management.dao.course.CourseMapper;
import com.happystudy2.happystudy2management.dao.grade.GradeMapper;
import com.happystudy2.happystudy2management.dao.student.StudentMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherMapper;
import com.happystudy2.happystudy2management.domain.dto.ClazzEditDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.course.CoursePO;
import com.happystudy2.happystudy2management.domain.po.grade.GradePO;
import com.happystudy2.happystudy2management.domain.po.student.StudentPO;
import com.happystudy2.happystudy2management.domain.po.teacher.TeacherPO;
import com.happystudy2.happystudy2management.domain.po.clazz.view.ClazzInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ClazzVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.service.ClazzService;
import com.happystudy2.happystudy2management.service.CourseService;
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
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private ClazzInfoViewMapper clazzInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;
    @Autowired
    private CourseService courseService;


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

    @Override
    public ListResultVO listClazz(MetaData metaData) {
        Example example = new Example(ClazzInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeType"))){
                criteria.andEqualTo("gradeType", metaData.getFilter().get("gradeType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeId"))){
                criteria.andEqualTo("gradeId", metaData.getFilter().get("gradeId"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("clazzType"))){
                criteria.andEqualTo("clazzType", metaData.getFilter().get("clazzType"));
            }

            if (!metaData.getExt().isEmpty()){
                List<String> ext = metaData.getExt();
                String e = "%"+ext.get(0)+"%";
                if (!e.equals("")){
                    criteria.andLike("name", e);
                    criteria.orLike("clNo", e);
                }
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
        PageInfo<ClazzInfoViewPO> pageInfo = new PageInfo<>(clazzInfoViewMapper.selectByExample(example));

        List<ClazzInfoViewPO> clazzInfoViewPOList = pageInfo.getList();

        List<ClazzVO> result = Lists.newArrayList();
        for (ClazzInfoViewPO clazzInfoViewPO : clazzInfoViewPOList){
            ClazzVO clazzVO = typeMapper.map(clazzInfoViewPO, ClazzVO.class);
            TypeVO gradeType = TypeVO.builder().typeCode(clazzInfoViewPO.getGradeType()).typeDescription(GradeTypeEnum.descriptionOf(clazzInfoViewPO.getGradeType())).build();
            TypeVO clazzType = TypeVO.builder().typeCode(clazzInfoViewPO.getClazzType()).typeDescription(ClazzTypeEnum.descriptionOf(clazzInfoViewPO.getClazzType())).build();
            clazzVO.setGradeType(gradeType);
            clazzVO.setClazzType(clazzType);
            result.add(clazzVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }

    @Transactional
    @Override
    public ClazzVO addClazz(ClazzEditDTO clazzEditDTO) throws BussinessExcecption{
        ClazzPO clazzPO = typeMapper.map(clazzEditDTO, ClazzPO.class);
        String clazzMasterId = clazzPO.getClazzMasterId();
        String gradeId = clazzPO.getGradeId();

        if (StringUtils.isBlank(clazzMasterId)){
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "缺少班主任id");
        }
        if (StringUtils.isBlank(gradeId)){
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "缺少年级id");
        }

        TeacherPO teacherPO = teacherMapper.selectByPrimaryKey(clazzMasterId);
        if (Objects.isNull(teacherPO)){
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "该教师 "+clazzMasterId+" 已经不存在");
        }
        clazzPO.setClazzMasterName(teacherPO.getName());

        GradePO gradePO = gradeMapper.selectByPrimaryKey(gradeId);
        Integer clNo = noGenerator.clazzNo(gradePO);
        clazzPO.setClNo(clNo);

        clazzMapper.insertSelective(clazzPO);
        teacherPO.setIsClazzMaster(true);
        teacherMapper.updateByPrimaryKeySelective(teacherPO);

        return typeMapper.map(clazzPO, ClazzVO.class);

    }
    @Transactional
    @Override
    public ClazzVO updateClazz(ClazzEditDTO clazzEditDTO) throws BussinessExcecption {
        ClazzPO clazzPO = typeMapper.map(clazzEditDTO, ClazzPO.class);
        ClazzPO exist = clazzMapper.selectByPrimaryKey(clazzPO);

        clazzPO.setLastModifyTime(exist.getLastModifyTime());
        clazzPO.setClNo(exist.getClNo());

        if (!StringUtils.equals(exist.getClazzMasterId(), clazzPO.getClazzMasterId())){
            String oldMasterId = exist.getClazzMasterId();
            String newMasterId = exist.getClazzMasterId();

            //更新旧班主任和新班主任的标签字段
            TeacherPO oldMaster = teacherMapper.selectByPrimaryKey(oldMasterId);
            oldMaster.setIsClazzMaster(false);
            TeacherPO newMaster = teacherMapper.selectByPrimaryKey(newMasterId);
            newMaster.setIsClazzMaster(true);
            try{
                teacherMapper.updateByPrimaryKeySelective(oldMaster);
                teacherMapper.updateByPrimaryKeySelective(newMaster);
            } catch (Exception e){
                throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
            }

            //获取最新班主任的姓名
            clazzPO.setClazzMasterName(newMaster.getName());
        }

        clazzMapper.updateByPrimaryKeySelective(clazzPO);
        return typeMapper.map(clazzPO, ClazzVO.class);

    }

    @Transactional
    @Override
    public ResultCop deleteClazz(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        ClazzPO clazzExample = new ClazzPO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                clazzExample.setId(id);
                ClazzPO exist = clazzMapper.selectByPrimaryKey(clazzExample);
                if (Objects.isNull(exist)){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                //解绑该班级学生
                List<StudentPO> clazzStuList = findStudentsByClazz(exist);
                if (Objects.nonNull(clazzStuList)&&(!clazzStuList.isEmpty())){
                    for (StudentPO stu : clazzStuList){
                        stu.setClazzId(null);
                        stu.setClazzMasterId(null);
                        studentMapper.updateByPrimaryKey(stu);
                    }
                }
                //解绑该班级的班主任
                if (StringUtils.isNotBlank(exist.getClazzMasterId())){
                    TeacherPO teacherPO = teacherMapper.selectByPrimaryKey(exist.getClazzMasterId());
                    teacherPO.setIsClazzMaster(false);
                    teacherMapper.updateByPrimaryKeySelective(teacherPO);
                }
                //TODO: 删除该班级的course
                if (!this.deleteCourseByClazz(exist)){
                    throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
                }

                exist.setDeleted(true);
                clazzMapper.updateByPrimaryKey(exist);
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
        res.setDescription("/r/n success: " + successCount + ", r/n invalid: " + notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }
    private Boolean deleteCourseByClazz(ClazzPO clazzPO){
        if (StringUtils.isBlank(clazzPO.getId())){
            return false;
        }
        List<CoursePO> coursePOList = findCourseByClazz(clazzPO);
        String ids = "";
        for (CoursePO coursePO : coursePOList){
            ids += clazzPO.getId() + StringBussinessUtil.ID_SPLITE_FORMATE;
        }
        ResultCop res = courseService.deleteCourse(StringBussinessUtil.splitIds(ids));
        return res.getIsSuccess();
    }
    private List<CoursePO> findCourseByClazz(ClazzPO clazzPO){
        String clazzId = clazzPO.getId();
        Example example = new Example(CoursePO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("clazzId", clazzId);

        return courseMapper.selectByExample(example);
    }
    private List<StudentPO> findStudentsByClazz(ClazzPO clazzPO){
        String clazzId = clazzPO.getId();
        if (StringUtils.isBlank(clazzId)){
            return null;
        }
        Example example = new Example(StudentPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("clazzId", clazzId);

        return studentMapper.selectByExample(example);
    }

    @Override
    public List<TeacherSimpleVO> listClazzMasterAbleTeacher(){
        Example example = new Example(TeacherPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        //criteria.andEqualTo("respType", ResponsibilityTeacherEnum.COMMON_TEACHER.getCode());
        criteria.andEqualTo("isClazzMaster", false);

        List<TeacherPO> teacherPOList = teacherMapper.selectByExample(example);

        return typeMapper.mapList(teacherPOList, TeacherSimpleVO.class);
    }
}
