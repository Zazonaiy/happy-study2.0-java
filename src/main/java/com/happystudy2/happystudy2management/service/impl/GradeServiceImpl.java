package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.GradeTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzMapper;
import com.happystudy2.happystudy2management.dao.grade.GradeInfoViewMapper;
import com.happystudy2.happystudy2management.dao.grade.GradeMapper;
import com.happystudy2.happystudy2management.dao.grade.GradeSubjectSimpleViewMapper;
import com.happystudy2.happystudy2management.dao.student.StudentMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherMapper;
import com.happystudy2.happystudy2management.domain.dto.GradeEditDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.grade.GradePO;
import com.happystudy2.happystudy2management.domain.po.grade.view.GradeSubjectSimpleViewPO;
import com.happystudy2.happystudy2management.domain.po.teacher.TeacherPO;
import com.happystudy2.happystudy2management.domain.po.grade.view.GradeInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.GradeVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SubjectSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;
import com.happystudy2.happystudy2management.service.ClazzService;
import com.happystudy2.happystudy2management.service.GradeService;
import com.happystudy2.happystudy2management.service.StudentService;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private GradeInfoViewMapper gradeInfoViewMapper;
    @Autowired
    private GradeSubjectSimpleViewMapper gradeSubjectSimpleViewMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClazzService clazzService;


    @Override
    public List<GradeVO> listAll() {
        Example example = new Example(GradePO.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("deleted", false);

        List<GradePO> gradePOList = gradeMapper.selectByExample(example);
        List<GradeVO> result = Lists.newArrayList();
        for (GradePO gradePO : gradePOList){
            GradeVO gradeVO = typeMapper.map(gradePO, GradeVO.class);
            gradeVO.setGradeType(GradeTypeEnum.descriptionOf(gradePO.getGradeType()));
            result.add(gradeVO);
        }
        return result;
    }

    @Override
    public List<GradeVO> listByGradeType(Integer gradeType) {
        if (Objects.isNull(gradeType)){
            return Lists.newArrayList();
        }
        Example example = new Example(GradePO.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeType", gradeType);
        List<GradePO> gradePOList = gradeMapper.selectByExample(example);
        List<GradeVO> result = Lists.newArrayList();
        for (GradePO gradePO : gradePOList){
            GradeVO gradeVO = typeMapper.map(gradePO, GradeVO.class);
            gradeVO.setGradeType(GradeTypeEnum.descriptionOf(gradePO.getGradeType()));
            result.add(gradeVO);
        }
        return result;
    }

    @Override
    public ListResultVO listGrade(MetaData metaData){
        Example example = new Example(GradeInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeType"))){
                criteria.andEqualTo("gradeType", metaData.getFilter().get("gradeType"));
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
        PageInfo<GradeInfoViewPO> pageInfo = new PageInfo<>(gradeInfoViewMapper.selectByExample(example));

        List<GradeInfoViewPO> gradeInfoViewPOList = pageInfo.getList();

        List<GradeVO> result = Lists.newArrayList();
        for (GradeInfoViewPO gradeInfoViewPO : gradeInfoViewPOList){
            GradeVO gradeVO = typeMapper.map(gradeInfoViewPO, GradeVO.class);
            gradeVO.setGradeType(GradeTypeEnum.descriptionOf(gradeInfoViewPO.getGradeType()));
            result.add(gradeVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }

    @Override
    public List<TeacherSimpleVO> listGradeMasterAbleTeacher() {
        Example example = new Example(TeacherPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        //criteria.andEqualTo("respType", ResponsibilityTeacherEnum.COMMON_TEACHER.getCode());
        criteria.andEqualTo("isGradeMaster", false);

        List<TeacherPO> teacherPOList = teacherMapper.selectByExample(example);

        return typeMapper.mapList(teacherPOList, TeacherSimpleVO.class);
    }


    private String getGradeIdByGNo(Integer gNo){
        Example example = new Example(GradePO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gNo", gNo);

        GradePO gradePO = gradeMapper.selectOneByExample(example);
        if (Objects.nonNull(gradePO)){
            return gradePO.getId();
        }

        return null;
    }
    @Transactional
    @Override
    public GradeVO addGrade(GradeEditDTO gradeEditDTO) throws BussinessExcecption{
        GradePO gradePO = typeMapper.map(gradeEditDTO, GradePO.class);
        String teacherId = gradePO.getGradeMasterId();

        TeacherPO teacherPO = null;
        if (StringUtils.isNotBlank(teacherId)){
            teacherPO = teacherMapper.selectByPrimaryKey(teacherId);
            gradePO.setGradeMasterName(teacherPO.getName());
        }

        //生成年级号并插入
        Integer gNo = noGenerator.grade(gradePO);
        gradePO.setGNo(gNo);

        gradeMapper.insertSelective(gradePO);
        if (Objects.nonNull(teacherPO)){
            teacherPO.setIsGradeMaster(true);
            teacherPO.setGradeMasterId(teacherPO.getId());
            String gradeId = getGradeIdByGNo(gNo);
            if (StringUtils.isNotBlank(gradeId)){
                teacherPO.setGradeId(gradeId);
            }else{
                throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "更改新年级主任的所属年级失败");
            }
            teacherMapper.updateByPrimaryKeySelective(teacherPO);
        }
        return typeMapper.map(gradePO, GradeVO.class);

    }

    @Transactional
    @Override
    public GradeVO updateGrade(GradeEditDTO gradeEditDTO) throws BussinessExcecption{
        GradePO gradePO = typeMapper.map(gradeEditDTO, GradePO.class);
        GradePO exist = gradeMapper.selectByPrimaryKey(gradePO);

        gradePO.setLastModifyTime(exist.getLastModifyTime());
        gradePO.setGNo(exist.getGNo());

        if (!StringUtils.equals(exist.getGradeMasterId(), gradePO.getGradeMasterId())){
            String oldMasterId = exist.getGradeMasterId();
            String newMasterId = gradePO.getGradeMasterId();

            //更新旧年级主任和新年级主任的标签字段
            TeacherPO oldMaster = teacherMapper.selectByPrimaryKey(oldMasterId);
            oldMaster.setIsGradeMaster(false);
            TeacherPO newMaster = teacherMapper.selectByPrimaryKey(newMasterId);
            newMaster.setIsGradeMaster(true);
            try{
                teacherMapper.updateByPrimaryKeySelective(oldMaster);
                teacherMapper.updateByPrimaryKeySelective(newMaster);
            } catch (Exception e){
                throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
            }

            //获取新年级主任最新姓名
            gradePO.setGradeMasterName(newMaster.getName());
        }

        try{
            gradeMapper.updateByPrimaryKeySelective(gradePO);
        }catch (Exception e){
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
        }
        return typeMapper.map(gradePO, GradeVO.class);
    }


    private List<ClazzPO> findClazzByGrade(GradePO gradePO){
        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gradePO.getId());

        return clazzMapper.selectByExample(example);
    }


    @Transactional
    @Override
    public ResultCop deleteGrade(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        GradePO gradeExample = new GradePO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                gradeExample.setId(id);
                GradePO exist = gradeMapper.selectByPrimaryKey(gradeExample);
                if (exist==null){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                //删除该年级所有班级、释放该年级所有学生、教师（施放学生在删除班级里，释放年级主任在教师里）
                Boolean clDelRes = deleteClazzByGrade(exist);
                if (!clDelRes){
                    throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "删除年级=>班级删除失败");
                }
                Boolean teacherReleaseRes = releaseGradeTeacher(exist);
                if (!teacherReleaseRes){
                    throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "删除年级=>教师释放失败");
                }

                exist.setDeleted(true);
                gradeMapper.updateByPrimaryKey(exist);
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
        res.setDescription("/r/n success: " + successCount + ", r/n invalid: " + notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }
    //删除该年级所有的班级（删除班级时会施放该班所有的学生但是不会删除）
    //TODO 若学生毕业需要删除学生，则另行操作
    private Boolean deleteClazzByGrade(GradePO exist){
        List<ClazzPO> clazzPOList = findClazzByGrade(exist);

        String idstr = "";
        for (ClazzPO clazzPO : clazzPOList){
            idstr += clazzPO.getId()+" ";
        }
        String[] ids = idstr.split(" ");
        ResultCop resultCop = clazzService.deleteClazz(ids);
        return resultCop.getIsSuccess();
    }
    //释放年级教师 并 释放年级主任
    private Boolean releaseGradeTeacher(GradePO exist){
        Example example = new Example(TeacherPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", exist.getId());

        try{
            List<TeacherPO> gradeTeacherList = teacherMapper.selectByExample(example);
            if (gradeTeacherList.isEmpty()){
                return true;
            }
            for (TeacherPO teacher : gradeTeacherList){
                if (StringUtils.equals(teacher.getId(), exist.getGradeMasterId())){
                    //该教师不再是年级主任
                    teacher.setIsGradeMaster(false);
                }
                teacher.setGradeId(null);
                teacher.setGradeMasterId(null);
                teacherMapper.updateByPrimaryKey(teacher);
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public List<SubjectSimpleVO> listExamSubject(String gradeId){
        Example example = new Example(GradeSubjectSimpleViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("gradeId", gradeId);
        List<GradeSubjectSimpleViewPO> gradeSubjectSimpleViewPOList = gradeSubjectSimpleViewMapper.selectByExample(example);

        return typeMapper.mapList(gradeSubjectSimpleViewPOList, SubjectSimpleVO.class);
    }

    @Override
    public GradeVO queryById(String gradeId) {
        if (StringUtils.isBlank(gradeId)){
            return null;
        }
        return typeMapper.map(gradeInfoViewMapper.selectByPrimaryKey(gradeId), GradeVO.class);
    }

}
