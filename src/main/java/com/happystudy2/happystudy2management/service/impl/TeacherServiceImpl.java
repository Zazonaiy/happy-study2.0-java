package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.*;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzMapper;
import com.happystudy2.happystudy2management.dao.grade.GradeMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherInfoViewMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherMapper;
import com.happystudy2.happystudy2management.domain.dto.TeacherEditDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.grade.GradePO;
import com.happystudy2.happystudy2management.domain.po.teacher.TeacherPO;
import com.happystudy2.happystudy2management.domain.po.teacher.view.TeacherInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.service.TeacherService;
import com.happystudy2.happystudy2management.util.TimeUtil;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private TeacherInfoViewMapper teacherInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;

    @Override
    public ListResultVO listTeacher(MetaData metaData){
        Example example = new Example(TeacherInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeType"))){
                criteria.andEqualTo("gradeType", metaData.getFilter().get("gradeType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("teacherType"))){
                Integer teacherType = Integer.parseInt(metaData.getFilter().get("teacherType"));
                if (teacherType.equals(TeacherTypeEnum.CLAZZ_MASTER.getCode())){
                    criteria.andEqualTo("isClazzMaster", true);
                }else if (teacherType.equals(TeacherTypeEnum.GRADE_MASTER.getCode())){
                    criteria.andEqualTo("isGradeMaster", true);
                }else if (teacherType.equals(TeacherTypeEnum.SCHOOLE_MASTER.getCode())){
                    criteria.andEqualTo("isSchoolMaster", true);
                }

            }
            //if (StringUtils.isNotBlank(metaData.getFilter().get("sex"))){
            //    criteria.andEqualTo("sex", Integer.parseInt(metaData.getFilter().get("sex")));
            //}


        }

        if (Objects.nonNull(metaData) && (!metaData.getExt().isEmpty())){
            List<String> ext = metaData.getExt();
            String e = "%"+ext.get(0)+"%";
            if (!e.equals("")){
                criteria.andLike("name", e);
                criteria.orLike("tNo", e);
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
        PageInfo<TeacherInfoViewPO> pageInfo = new PageInfo<>(teacherInfoViewMapper.selectByExample(example));

        List<TeacherInfoViewPO> teacherInfoViewPOList = pageInfo.getList();

        List<TeacherVO> result = Lists.newArrayList();
        for (TeacherInfoViewPO teacherInfoViewPO : teacherInfoViewPOList){
            TeacherVO teacherVO = typeMapper.map(teacherInfoViewPO, TeacherVO.class);
            teacherVO.setAge(TimeUtil.mapAge(teacherInfoViewPO.getBirthday()));
            teacherVO.setGradeType(GradeTypeEnum.descriptionOf(teacherInfoViewPO.getGradeType()));

            TypeVO teacherType = this.getTeacherType(teacherInfoViewPO);
            teacherVO.setTeacherType(teacherType);
            teacherVO.setSex(SexEnum.sexOf(teacherInfoViewPO.getSex()));

            result.add(teacherVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }
    private TypeVO getTeacherType(TeacherInfoViewPO teacherInfoViewPO){
        Integer code = teacherInfoViewPO.getIsSchoolMaster() ? TeacherTypeEnum.SCHOOLE_MASTER.getCode() :
                teacherInfoViewPO.getIsGradeMaster() ? TeacherTypeEnum.GRADE_MASTER.getCode() :
                        teacherInfoViewPO.getIsClazzMaster() ? TeacherTypeEnum.CLAZZ_MASTER.getCode() :
                                TeacherTypeEnum.COMMON_TEACHER.getCode();

        String description = TeacherTypeEnum.codeOf(code) == null ? null : TeacherTypeEnum.codeOf(code).getDescription();
        return TypeVO.builder().typeCode(code).typeDescription(description).build();
    }

    @Override
    public TeacherVO addTeacher(TeacherEditDTO teacherEditDTO){
        TeacherPO teacherPO = typeMapper.map(teacherEditDTO, TeacherPO.class);
        teacherPO.setMemberType(MemberTypeEnum.TEACHER.getCode());

        Integer tNo = noGenerator.teacherNo(teacherPO);
        teacherPO.setTNo(tNo);

        //TODO: 暂且只允许创建一般授课教师
        teacherPO.setIsSchoolMaster(false);
        teacherPO.setIsGradeMaster(false);
        teacherPO.setIsClazzMaster(false);
        teacherPO.setRespType(ResponsibilityTeacherEnum.COMMON_TEACHER.getCode());

        GradePO gradePO = gradeMapper.selectByPrimaryKey(teacherPO.getGradeId());
        if (Objects.nonNull(gradePO)){
            teacherPO.setGradeMasterId(gradePO.getGradeMasterId());
        }else{
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "年级不存在了");
        }

        teacherMapper.insertSelective(teacherPO);
        return typeMapper.map(teacherPO, TeacherVO.class);
    }

    @Override
    public TeacherVO updateTeacher(TeacherEditDTO teacherEditDTO){
        TeacherPO teacherPO = typeMapper.map(teacherEditDTO, TeacherPO.class);
        TeacherPO exist = teacherMapper.selectByPrimaryKey(teacherPO);

        GradePO gradePO = gradeMapper.selectByPrimaryKey(teacherPO.getGradeId());
        if (Objects.nonNull(gradePO)){
            teacherPO.setGradeMasterId(gradePO.getGradeMasterId());
        }else{
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR, "年级不存在了");
        }

        teacherPO.setLastModifyTime(exist.getLastModifyTime());
        teacherMapper.updateByPrimaryKeySelective(teacherPO);
        return typeMapper.map(teacherPO, TeacherVO.class);
    }

    @Transactional
    @Override
    public ResultCop deleteTeacher(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        TeacherPO teacherExample = new TeacherPO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                teacherExample.setId(id);
                TeacherPO exist = teacherMapper.selectByPrimaryKey(teacherExample);
                if (Objects.isNull(exist)){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                this.deleteTeacherResp(exist);
                //TODO: 解除教师的授课

                exist.setDeleted(true);
                teacherMapper.updateByPrimaryKeySelective(exist);
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
        res.setDescription("/r/n success: " + successCount + ", /r/n invalid: "+notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }

    @Override
    public TeacherPO queryByNo(Integer tNo) {
        if (Objects.isNull(tNo)){
            return null;
        }

        Example example = new Example(TeacherPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("tNo", tNo);

        return teacherMapper.selectOneByExample(example);
    }

    private boolean deleteTeacherResp(TeacherPO exist){
        if (exist.getIsGradeMaster()){
            String gradeId = exist.getGradeId();
            if (StringUtils.isBlank(gradeId)){
                return false;
            }
            GradePO gradePO = gradeMapper.selectByPrimaryKey(gradeId);
            gradePO.setGradeMasterId(null);
            gradePO.setGradeMasterName(null);
            gradeMapper.updateByPrimaryKey(gradePO);
        }
        if (exist.getIsClazzMaster()){
            if (StringUtils.isBlank(exist.getId())){
                return false;
            }
            Example example = new Example(ClazzPO.class);
            Example.Criteria criteria = example.createCriteria();

            criteria.andEqualTo("deleted", false);
            criteria.andEqualTo("clazzMasterId", exist.getId());
            List<ClazzPO> clazzPOs = clazzMapper.selectByExample(example);
            for (ClazzPO clazzPO : clazzPOs){
                clazzPO.setClazzMasterId(null);
                clazzPO.setClazzMasterName(null);
                clazzMapper.updateByPrimaryKey(clazzPO);
            }
        }
        return true;
    }

}
