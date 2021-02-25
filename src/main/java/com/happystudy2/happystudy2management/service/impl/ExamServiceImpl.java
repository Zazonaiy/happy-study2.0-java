package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.constants.bussiness.ExamRoomNameFormatter;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ExamRoomRentStateEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ExamStateEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ExamTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ProOpinionEnum;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.LifeCycle;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzInfoViewMapper;
import com.happystudy2.happystudy2management.dao.clazz.ClazzMapper;
import com.happystudy2.happystudy2management.dao.exam.*;
import com.happystudy2.happystudy2management.dao.exam.view.*;
import com.happystudy2.happystudy2management.dao.grade.GradeInfoViewMapper;
import com.happystudy2.happystudy2management.dao.student.StudentInfoViewMapper;
import com.happystudy2.happystudy2management.dao.subject.SubjectInfoViewMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherInfoViewMapper;
import com.happystudy2.happystudy2management.domain.dto.exam.*;
import com.happystudy2.happystudy2management.domain.dto.noGenerator.ExamRoomNoSimpleDTO;
import com.happystudy2.happystudy2management.domain.dto.task.TaskDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.clazz.view.ClazzInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.exam.*;
import com.happystudy2.happystudy2management.domain.po.exam.score.ExamScorePO;
import com.happystudy2.happystudy2management.domain.po.exam.view.ExamInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.exam.view.ExamRoomInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.exam.view.ExamSubjectInfoPO;
import com.happystudy2.happystudy2management.domain.po.grade.view.GradeInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.student.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.subject.view.SubjectInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.teacher.view.TeacherInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.*;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamRoomVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSubjectVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamVO;
import com.happystudy2.happystudy2management.factory.ProFactory;
import com.happystudy2.happystudy2management.service.ExamService;
import com.happystudy2.happystudy2management.service.TaskService;
import com.happystudy2.happystudy2management.task.impl.BaseTaskImpl;
import com.happystudy2.happystudy2management.task.impl.exam.ExamCountDownTask;
import com.happystudy2.happystudy2management.task.impl.exam.ExamRemindTask;
import com.happystudy2.happystudy2management.util.TimeUtil;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Service
public class ExamServiceImpl implements ExamService {
    private static final Integer DEFAULT_DAY = 7;

    @Autowired
    private ExamMapper examMapper;
    @Autowired
    private ExamRoomMapper examRoomMapper;
    @Autowired
    private ExamSubjectMapper examSubjectMapper;
    @Autowired
    private ExamTeacherInviglateMapper examTeacherInviglateMapper;
    @Autowired
    private ExamTeacherMarkingMapper examTeacherMarkingMapper;
    @Autowired
    private ExamTeacInvRoomMiddleMapper examTeacInvRoomMiddleMapper;
    @Autowired
    private ExamSubjectStudentMapper examSubjectStudentMapper;
    @Autowired
    private ExamScoreMapper examScoreMapper;
    @Autowired
    private ExamSubjectInfoViewMapper examSubjectInfoViewMapper;
    @Autowired
    private ExamRoomInfoViewMapper examRoomInfoViewMapper;
    @Autowired
    private GradeInfoViewMapper gradeInfoViewMapper;
    @Autowired
    private SubjectInfoViewMapper subjectInfoViewMapper;
    @Autowired
    private TeacherInfoViewMapper teacherInfoViewMapper;
    @Autowired
    private StudentInfoViewMapper studentInfoViewMapper;
    @Autowired
    private ExamSubjectStudentInfoViewMapper examSubjectStudentInfoViewMapper;
    @Autowired
    private ExamTeacherInvInfoViewMapper examTeacherInvInfoViewMapper;
    @Autowired
    private ExamTeacherMarInfoViewMapper examTeacherMarInfoViewMapper;
    @Autowired
    private ExamInfoViewMapper examInfoViewMapper;
    @Autowired
    private ClazzInfoViewMapper clazzInfoViewMapper;
    @Autowired
    private ProRentExamRoomMapper proRentExamRoomMapper;
    @Autowired
    private TaskService taskService;

    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;
    @Autowired
    private ProFactory proFactory;


    @Transactional
    @Override
    public ResultCop examRegistBase(ExamRegistDTO examRegistDTO) {
        ResultCop resultCop = new ResultCop();
        ExamPO examPO = typeMapper.map(examRegistDTO, ExamPO.class);
        Integer eNo = noGenerator.examNo(examPO);
        examPO.setENo(eNo);
        //创建考试
        examPO = this.createExam(examPO, 3);
        for (ExamRegistSubjectDTO examRegistSubjectDTO : examRegistDTO.getSubjectList()){
            examRegistSubjectDTO.setExamId(examPO.getId());
        }

        //创建考试科目
        try {
            //开设考场
            String errorMsg = configExamRoom(examPO, examRegistDTO);
            if (Objects.nonNull(errorMsg)){
                resultCop.setIsSuccess(false);
                resultCop.setDescription(errorMsg);
            }
            //创建考试科目
            List<ExamRegistSubjectDTO> examSubjectList = examRegistDTO.getSubjectList();
            for (ExamRegistSubjectDTO examSubjectDTO : examSubjectList){
                SubjectInfoViewPO subjectViewPO = subjectInfoViewMapper.selectByPrimaryKey(examSubjectDTO.getSubjectId());
                if (Objects.isNull(subjectViewPO)){
                    //TODO: 失败信息(该科目不存在)
                    resultCop.setDescription("科目不存在");
                    resultCop.setIsSuccess(false);
                }
                ExamSubjectPO examSubjectPO = typeMapper.map(examSubjectDTO, ExamSubjectPO.class);
                examSubjectPO.setName(subjectViewPO.getName());
                examSubjectMapper.insertSelective(examSubjectPO);
            }

            resultCop.setIsSuccess(true);
            resultCop.setDescription(examPO.getId());
        } catch (RuntimeException e){
            e.printStackTrace();
            //resultCop.setIsSuccess(false);
            //if (StringUtils.isBlank(resultCop.getDescription())){
            //    resultCop.setDescription("系统错误");
            //}
            //return resultCop;
            throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
        } finally {
            return resultCop;
        }

        //resultCop.setIsSuccess(true);
        //resultCop.setDescription(examPO.getName());
        //return resultCop;
    }

    /**
     * 创建考试
     * @param examPO
     * @return
     */
    private ExamPO createExam(ExamPO examPO, Integer stepCount){
        examPO.setExamState(ExamStateEnum.CREATING.getCode());
        examPO.setCreateProgress(stepCount);
        examMapper.insertSelective(examPO);
        Example example = new Example(ExamPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("eNo", examPO.getENo());
        return examMapper.selectOneByExample(example);
    }

    /**
     * 开设考场
     * @param examPO
     * @param examRegistDTO
     * @return
     */
    private String configExamRoom(ExamPO examPO, ExamRegistDTO examRegistDTO){
        ExamRegistRoomDTO examRegistRoomDTO = examRegistDTO.getExamRegistRoom();
        String gradeId = examRegistDTO.getGradeId();
        //examRoomPO会被循环使用来insert，有些固有的属性提到了方法前面，只需要每次循环时更具具体情况修改
        ExamRoomPO examRoomPO = typeMapper.map(examRegistDTO.getExamRegistRoom(), ExamRoomPO.class);
        examRoomPO.setExamId(examPO.getId());
        ExamRoomNoSimpleDTO examRoomNoSimpleDTO = noGenerator.examRoomNo(examPO);
        examRoomPO.setRoomNo(examRoomNoSimpleDTO.getExamRoomNo());

        Boolean useOurGradeRoom = examRegistRoomDTO.getUseOurGradeRoom();
        Boolean rentTag = examRegistRoomDTO.getRentTag();
        Boolean differentPlaceTag = examRegistRoomDTO.getDifferentPlaceTag();

        GradeInfoViewPO gradeInfoViewPO = gradeInfoViewMapper.selectByPrimaryKey(gradeId);
        Integer studentCount = gradeInfoViewPO.getStudentCount();
        Integer clazzCount = gradeInfoViewPO.getClazzCount();
        Integer minRoomCount = this.getRoomMinCount(studentCount, examRegistRoomDTO.getMaxSize());
        List<Integer> noList = noGenerator.examRoomNoBatch(examPO, minRoomCount);
        Integer index = 0;
        if (useOurGradeRoom){
            List<ClazzPO> ourClazzList = this.getClazzListByGradeId(gradeId);
            if (ourClazzList.size() < minRoomCount){
                if (rentTag){
                    // 本年级教室+其他年级教室
                    List<ClazzPO> rentClazzList = this.getClazzListByGradeId(examRegistRoomDTO.getRentGradeId());
                    if (minRoomCount-ourClazzList.size()>rentClazzList.size()){
                        return "租用年级教室不足";
                    }

                    examRoomPO.setRentTag(false);
                    examRoomPO.setDifferentPlaceTag(false);
                    for (ClazzPO ourClazz : ourClazzList){
                        examRoomPO.setRoomNo(noList.get(index));
                        examRoomPO.setRoomPlace(ourClazz.getId());
                        examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                        examRoomMapper.insertSelective(examRoomPO);
                        index++;
                    }
                    examRoomPO.setRentTag(true);
                    examRoomPO.setRentGradeId(examRegistRoomDTO.getRentGradeId());
                    examRoomPO.setRentState(ExamRoomRentStateEnum.WAIT.getCode());
                    examRoomPO.setRoomPlace("其他年级教室");
                    for (; index < minRoomCount; index++){
                        examRoomPO.setRoomNo(noList.get(index));
                        examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                        examRoomMapper.insertSelective(examRoomPO);
                    }

                    Boolean appCreateRes = this.sendRentMsg(gradeId, examRegistRoomDTO.getRentGradeId(), examRegistRoomDTO.getRentRemark(), minRoomCount-ourClazzList.size(), examPO.getName());
                    if (!appCreateRes){
                        return "申请租用教室流程创建失败";
                    }
                    return null;
                }
                if (differentPlaceTag){
                    // 本年级教室+其他场地
                    Boolean useVirtualRoomNo = examRegistRoomDTO.getUseVirtualRoomNo();
                    examRoomPO.setRentTag(false);
                    examRoomPO.setDifferentPlaceTag(false);
                    for (ClazzPO ourClazz : ourClazzList){
                        examRoomPO.setRoomNo(noList.get(index));
                        examRoomPO.setRoomPlace(ourClazz.getId());
                        examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                        examRoomMapper.insertSelective(examRoomPO);
                        index++;
                    }
                    examRoomPO.setDifferentPlaceTag(true);
                    examRoomPO.setRoomPlace("其他场地");
                    for (; index < minRoomCount; index++){
                        examRoomPO.setRoomNo(noList.get(index));
                        if (useVirtualRoomNo){
                            examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                        }else{
                            examRoomPO.setName(ExamRoomNameFormatter.ELSE_PALCE);
                        }
                        examRoomMapper.insertSelective(examRoomPO);
                    }

                    return null;
                }

                return "本年级教室数量不够开设考场";
            }

            // 本年级教室
            examRoomPO.setRentTag(false);
            examRoomPO.setDifferentPlaceTag(false);
            for (ClazzPO ourClazz : ourClazzList){
                examRoomPO.setRoomNo(noList.get(index));
                examRoomPO.setRoomPlace(ourClazz.getId());
                examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                examRoomMapper.insertSelective(examRoomPO);
                index++;
            }

            return null;
        }else {
            if (rentTag){
                String rentGradeId = examRegistRoomDTO.getRentGradeId();
                List<ClazzPO> rentClazzList = this.getClazzListByGradeId(rentGradeId);
                if (rentClazzList.size() < minRoomCount){
                    if (differentPlaceTag){
                        // 其他年级教室+其他场地
                        Boolean useVirtualRoomNo = examRegistRoomDTO.getUseVirtualRoomNo();
                        examRoomPO.setRentState(ExamRoomRentStateEnum.WAIT.getCode());
                        examRoomPO.setRentTag(true);
                        examRoomPO.setRentGradeId(examRegistRoomDTO.getRentGradeId());
                        examRoomPO.setDifferentPlaceTag(false);
                        for (ClazzPO clazzPO : rentClazzList){
                            examRoomPO.setRoomPlace(clazzPO.getId());
                            examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                            examRoomPO.setRoomNo(noList.get(index));
                            examRoomMapper.insertSelective(examRoomPO);
                        }
                        examRoomPO.setRentState(null);
                        examRoomPO.setRentTag(false);
                        examRoomPO.setRentGradeId(null);
                        examRoomPO.setDifferentPlaceTag(true);
                        for (; index < minRoomCount; index++){
                            examRoomPO.setRoomNo(noList.get(index));
                            if (useVirtualRoomNo){
                                examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                            }else{
                                examRoomPO.setName(ExamRoomNameFormatter.ELSE_PALCE);
                            }
                            examRoomMapper.insertSelective(examRoomPO);
                        }

                        Boolean appCreateRes = this.sendRentMsg(gradeId, examRegistRoomDTO.getRentGradeId(), examRegistRoomDTO.getRentRemark(), rentClazzList.size(), examPO.getName());
                        if (!appCreateRes){
                            return "申请租用教室流程创建失败";
                        }

                        return null;
                    }else{
                        return "申请租用教室的年级教室数量不够开设考场";
                    }
                }

                // 其他年级教室
                examRoomPO.setRentState(ExamRoomRentStateEnum.WAIT.getCode());
                examRoomPO.setRentTag(true);
                examRoomPO.setRentGradeId(examRegistRoomDTO.getRentGradeId());
                examRoomPO.setDifferentPlaceTag(false);
                for (ClazzPO clazzPO : rentClazzList){
                    examRoomPO.setRoomPlace(clazzPO.getId());
                    examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                    examRoomPO.setRoomNo(noList.get(index));
                    examRoomMapper.insertSelective(examRoomPO);
                }

                Boolean appCreateRes = this.sendRentMsg(gradeId, examRegistRoomDTO.getRentGradeId(), examRegistRoomDTO.getRentRemark(), rentClazzList.size(), examPO.getName());
                if (!appCreateRes){
                    return "申请租用教室流程创建失败";
                }

                return null;
            }
            if (differentPlaceTag) {
                // 其他场地
                Boolean useVirtualRoomNo = examRegistRoomDTO.getUseVirtualRoomNo();
                examRoomPO.setRentState(null);
                examRoomPO.setRentTag(false);
                examRoomPO.setRentGradeId(null);
                examRoomPO.setDifferentPlaceTag(true);
                for (; index < minRoomCount; index++){
                    examRoomPO.setRoomNo(noList.get(index));
                    if (useVirtualRoomNo){
                        examRoomPO.setName(ExamRoomNameFormatter.formatIt(ExamRoomNameFormatter.COMMENT, String.valueOf(index+1)));
                    }else{
                        examRoomPO.setName(ExamRoomNameFormatter.ELSE_PALCE);
                    }
                    examRoomMapper.insertSelective(examRoomPO);
                }

                return null;
            }

            return "缺少场地计划，考场开设失败";
        }

    }
    private List<ClazzPO> getClazzListByGradeId(String gradeId){
        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gradeId);

        return clazzMapper.selectByExample(example);
    }
    private Integer getRoomMinCount(Integer studentCount, Integer roomMaxSize){
        Double needRoomCountDouble = Math.ceil(studentCount*1.0/roomMaxSize);
        return needRoomCountDouble.intValue();
    }
    private boolean sendRentMsg(String gradeId, String rentGradeId, String rentRemark, Integer rentRoomCount, String examName){
        String rentMsg = "租用教室: " + rentRoomCount + "间。用于考试: " + examName;
        if (StringUtils.isBlank(rentRemark)){
            rentRemark = rentMsg;
        }else{
            rentRemark = rentMsg + rentRemark;
        }

        ProRentExamRoomPO proRentExamRoomPO = (ProRentExamRoomPO)proFactory.registPro(LifeCycle.builder().day(DEFAULT_DAY).build(), gradeId, rentGradeId);
        proRentExamRoomPO.setRentRemark(rentRemark);

        proRentExamRoomMapper.insertSelective(proRentExamRoomPO);

        return true;
    }

    @Transactional
    @Override
    public ResultCop examRegistMemberConfig(ExamRegistMemberDTO examRegistMemberDTO){
        ResultCop resultCop = new ResultCop();
        Integer count = 0;
        ExamPO examPO = examMapper.selectByPrimaryKey(examRegistMemberDTO.getExamId());
        List<ExamMemberConfigDTO> examMemberConfigList = examRegistMemberDTO.getExamMemberConfigDTOList();

        for (ExamMemberConfigDTO examMemberConfigDTO : examMemberConfigList){
            String examSubjectId = examMemberConfigDTO.getExamSubjectId();
            try{
                //mar
                this.configMarTeacher(examPO, examMemberConfigDTO.getMarConfig(), examSubjectId);
                //inv + student
                this.configInvTeacherAndStudent(examPO, examMemberConfigDTO.getInvConfig(), examMemberConfigDTO.getStudentConfig(), examSubjectId);
                count++;
            } catch (RuntimeException e){
                e.printStackTrace();
                resultCop.setIsSuccess(false);
                resultCop.setDescription("操作失败，当前科目index: "+count);
                throw new BussinessExcecption(BussinessErrorCodeEnum.TRANSACTIONAL_FAILED_ERROR);
            } finally {
                if (!resultCop.getIsSuccess()){
                    return resultCop;
                }
            }
        }
        examPO.setCreateProgress(4);
        examMapper.updateByPrimaryKeySelective(examPO);

        resultCop.setIsSuccess(true);
        resultCop.setDescription("操作成功！共 <"+count+"> 项 科目人员配置");

        return resultCop;
    }
    private Boolean configMarTeacher(ExamPO examPO, MarConfigDTO marConfigDTO, String examSubjectId){
        String examId = examPO.getId();
        List<ExamMemberDTO> marTeacherList = marConfigDTO.getMarTeacherList();
        for (ExamMemberDTO marTeacher : marTeacherList){
            ExamTeacherMarkingPO examTeacherMarkingPO = new ExamTeacherMarkingPO();
            examTeacherMarkingPO.setExamId(examId);
            examTeacherMarkingPO.setExamSubjectId(examSubjectId);
            examTeacherMarkingPO.setTeacherId(marTeacher.getId());
            examTeacherMarkingMapper.insertSelective(examTeacherMarkingPO);
        }
        //marConfigDTO.getId()

        return true;
    }
    //subjectId不是Subject表的id，而是exam_subject表的id
    private Boolean configInvTeacherAndStudent(ExamPO examPO, InvConfigDTO invConfigDTO, StudentConfigDTO studentConfigDTO, String examSubjectId){
        String examId = examPO.getId();
        Set<String> roomIdSet = invConfigDTO.getInvTeacherRoomMap().keySet();
        Boolean randomStudent = studentConfigDTO.getRandomStudent();
        if (randomStudent){
            //TODO: 系统随机配置学生的考场
            this.randomStudentRoomConfig(examPO, studentConfigDTO);
            return true;
        }

        for (String roomId : roomIdSet){
            List<ExamMemberDTO> oneRoomInvList = invConfigDTO.getInvTeacherRoomMap().get(roomId);
            List<ExamMemberDTO> oneRoomStudentList = studentConfigDTO.getStudentRoomMap().get(roomId);
            for (ExamMemberDTO inv : oneRoomInvList){
                ExamTeacherInviglatePO examTeacherInviglatePO = new ExamTeacherInviglatePO();
                examTeacherInviglatePO.setExamId(examId);
                examTeacherInviglatePO.setTeacherId(inv.getId());
                examTeacherInviglatePO.setExamSubjectId(examSubjectId);
                examTeacherInviglateMapper.insertSelective(examTeacherInviglatePO);

                examTeacherInviglatePO.setDeleted(false);
                ExamTeacherInviglatePO select = examTeacherInviglateMapper.selectOne(examTeacherInviglatePO);
                ExamTeacInvRoomMiddlePO middle = new ExamTeacInvRoomMiddlePO();
                middle.setExamRoomId(roomId);
                middle.setTeacherInvId(select.getId());
                examTeacInvRoomMiddleMapper.insertSelective(middle);
            }

            for (ExamMemberDTO student : oneRoomStudentList){
                ExamSubjectStudentPO examSubjectStudentPO = new ExamSubjectStudentPO();
                examSubjectStudentPO.setExamId(examId);
                examSubjectStudentPO.setExamRoomId(roomId);
                examSubjectStudentPO.setExamSubjectId(examSubjectId);
                examSubjectStudentPO.setStudentId(student.getId());
                examSubjectStudentMapper.insertSelective(examSubjectStudentPO);

                examSubjectStudentPO.setDeleted(false);
                ExamSubjectStudentPO select = examSubjectStudentMapper.selectOne(examSubjectStudentPO);
                //创建该学生该门科目考试的成绩单（空）
                this.createStudentSubjectScore(select, examSubjectId);
            }


        }
        return true;
    }
    private Boolean createStudentSubjectScore(ExamSubjectStudentPO examSubjectStudentPO, String examSubjectId){
        ExamScorePO examScorePO = new ExamScorePO();
        examScorePO.setSubjectStudentId(examSubjectStudentPO.getId());
        examScorePO.setExamSubjectId(examSubjectId);

        examScoreMapper.insertSelective(examScorePO);

        return true;
    }
    private Boolean randomStudentRoomConfig(ExamPO examPO, StudentConfigDTO studentConfigDTO){
        //TODO: 系统随机分配学生的考场配置


        return null;
    }

    @Override
    public ResultCop examRegistTaskConfig(ExamRegistTaskDTO examRegistTaskDTO){
        ResultCop resultCop = new ResultCop();

        String examId = examRegistTaskDTO.getExamId();
        ExamPO examPO = examMapper.selectByPrimaryKey(examId);
        if (examRegistTaskDTO.getCreateExamRemind()){
            ExamRemindConfigDTO examRemindConfigDTO = examRegistTaskDTO.getExamRemind();
            examRemindConfigDTO.getBegin().getDoTime();
            List<ExamSubjectPO> subjectPOList = getSubjectListByExamId(examId);

            List<Integer> doTimeBegin = examRemindConfigDTO.getBegin().getDoTime();
            List<Integer> doTimeEnd = examRemindConfigDTO.getEnd().getDoTime();
            if (Objects.nonNull(doTimeBegin)&&doTimeBegin.size()>0){
                String beginDate = examPO.getBeginDate();
                if (!this.judgExamRemindTask(beginDate)){
                    for (ExamSubjectPO examSubjectPO : subjectPOList){
                        //每个科目的考试提醒
                        String beginTime = examSubjectPO.getBeginTime(); //开考时间
                        for (Integer doTime : examRemindConfigDTO.getBegin().getDoTime()){
                            //每一个提醒创建一个task
                            BaseTaskImpl task = new ExamRemindTask("离"+examSubjectPO.getName()+"开考还有 "+doTime+"分钟");//TODO:
                            taskService.createTask(TaskDTO.builder().cron(this.getRegistTaskCron(beginTime, doTime)).task(task).build(), true);
                        }
                    }

                }

            }
            if (Objects.nonNull(doTimeEnd)&&doTimeEnd.size()>0){
                String endDate = examPO.getEndDate();
                if (!this.judgExamRemindTask(endDate)){
                    for (ExamSubjectPO examSubjectPO : subjectPOList){
                        //每个科目的考试提醒
                        String endTime = examSubjectPO.getEndTime(); //开考时间
                        for (Integer doTime : examRemindConfigDTO.getEnd().getDoTime()){
                            //每一个提醒创建一个task
                            BaseTaskImpl task = new ExamRemindTask("离"+examSubjectPO.getName()+"考试结束还有 "+doTime+"分钟");//TODO:
                            taskService.createTask(TaskDTO.builder().cron(this.getRegistTaskCron(endTime, doTime)).task(task).build(), true);
                        }
                    }
                }
            }
            resultCop.setDescription("任务创建成功");
        }

        if (examRegistTaskDTO.getCreateExamCountDown()){
            ExamCountDownConfigDTO examCountDownConfigDTO = examRegistTaskDTO.getExamCountDown();
            if (!examCountDownConfigDTO.getDoTimeNow()){
                //TODO: 定时启动
            }
            String fre = examCountDownConfigDTO.getFrequency();

            BaseTaskImpl task;
            if (fre.equals("everyday")){
                task = new ExamCountDownTask(examPO.getBeginDate(), examPO.getName(), false);
            }else {
                task = new ExamCountDownTask(examPO.getBeginDate(), examPO.getName(), true);
            }

            String cron = "0 0 7 * *";
            taskService.createTask(TaskDTO.builder().cron(cron).task(task).build(), true);
            resultCop.setDescription("任务创建成功");
        }


        examPO.setExamState(ExamStateEnum.DOABLE.getCode());
        examPO.setCreateProgress(0);
        examMapper.updateByPrimaryKeySelective(examPO);

        resultCop.setIsSuccess(true);

        return resultCop;

    }

    private List<ExamSubjectPO> getSubjectListByExamId(String examId){
        Example example = new Example(ExamSubjectPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("examId", examId);
        List<ExamSubjectPO> examSubjectPOList = examSubjectMapper.selectByExample(example);
        return examSubjectPOList;
    }
    private boolean judgExamRemindTask(String date){
        String[] times = date.split("-");
        String[] nowTimes = TimeUtil.DATE_FORMAT.format(new Date()).split("-");


        if (Integer.parseInt(times[0])<Integer.parseInt(nowTimes[0])){
            return false;
        }else if (Integer.parseInt(times[0])==Integer.parseInt(nowTimes[0])){
            if (Integer.parseInt(times[1])<Integer.parseInt(nowTimes[1])){
                return false;
            }else if (Integer.parseInt(times[1])==Integer.parseInt(nowTimes[1])){
                if (Integer.parseInt(times[2])<=Integer.parseInt(times[2])){
                    return false;
                }else{
                    return true;
                }
            }else {
                return true;
            }
        }else {
            return true;
        }


    }
    private String getRegistTaskCron(String time, Integer doTime){
        StringBuffer res = new StringBuffer();
        //TODO:
        res.append("");
        String[] times = time.split(":");


        return null;
    }

    @Override
    public List<ExamSimpleVO> listCreatingExamByGrade(String gradeId){
        if (StringUtils.isBlank(gradeId)){
            return null;
        }

        Example example = new Example(ExamPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gradeId);
        criteria.andEqualTo("examState", ExamStateEnum.CREATING.getCode());

        //List<ExamSimpleVO> result = typeMapper.mapList(examMapper.selectByExample(example), ExamSimpleVO.class);
        List<ExamPO> examPOList = examMapper.selectByExample(example);
        List<ExamSimpleVO> result = Lists.newArrayList();
        //TODO: 判断这些创建中的考试创建到哪个步骤了
        for (ExamPO examPO : examPOList){
            ExamSimpleVO examSimpleVO = typeMapper.map(examPO, ExamSimpleVO.class);
            examSimpleVO.setStepCount(examPO.getCreateProgress());
            result.add(examSimpleVO);
        }
        //for (ExamSimpleVO examSimpleVO : result){
        //    Integer step = this.jugeExamStep(examSimpleVO);
        //    examSimpleVO.setStepCount(step);
        //}

        return result;
    }
    private Integer jugeExamStep(ExamSimpleVO examSimpleVO){
        /*
        Example example = new Example(ExamSubjectInfoPO.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("examId", examSimpleVO.getId());
        Integer subjectInfoCount = examSubjectInfoViewMapper.selectCountByExample(example);
        if (subjectInfoCount==0){
            return 0;
        }else{
            Example example1 = new Example(ExamSubjectStudentInfoViewPO.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria.andEqualTo("examId", examSimpleVO.getId());
            Integer studentCount = examSubjectStudentInfoViewMapper.selectCountByExample(example1);
            if (studentCount==0){
                return 3;
            }else{
                //TODO return null已完成创建的考试
                return 4;
            }
        }*/
        return null;
    }

    @Override
    public List<ExamSubjectVO> listExamSubject(String examId) {
        Example example = new Example(ExamSubjectInfoPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("examId", examId);
        List<ExamSubjectInfoPO> examSubjectInfoPOList = examSubjectInfoViewMapper.selectByExample(example);

        List<ExamSubjectVO> result = Lists.newArrayList();
        for (ExamSubjectInfoPO examSubjectInfoPO : examSubjectInfoPOList){
            ExamSubjectVO examSubjectVO = typeMapper.map(examSubjectInfoPO, ExamSubjectVO.class);
            examSubjectVO.setExamState(TypeVO.builder().typeCode(examSubjectInfoPO.getExamState()).typeDescription(ExamStateEnum.descriptionOf(examSubjectInfoPO.getExamState())).build());
            result.add(examSubjectVO);
        }

        return result;
    }

    @Override
    public List<ExamRoomVO> listExamRoom(String examId) {
        Example example = new Example(ExamRoomInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("examId", examId);
        List<ExamRoomInfoViewPO> examRoomInfoViewPOList = examRoomInfoViewMapper.selectByExample(example);

        List<ExamRoomVO> result = Lists.newArrayList();
        for (ExamRoomInfoViewPO examRoomInfoViewPO : examRoomInfoViewPOList){
            ExamRoomVO examRoomVO = typeMapper.map(examRoomInfoViewPO, ExamRoomVO.class);
            examRoomVO.setDifferentPlaceRemark(examRoomInfoViewPO.getRemark());
            examRoomVO.setRentState(TypeVO.builder().typeCode(examRoomInfoViewPO.getRentState()).typeDescription(ProOpinionEnum.descriptionOf(examRoomInfoViewPO.getRentState())).build());
            result.add(examRoomVO);
        }

        return result;
    }

    @Override
    public List<TeacherSimpleVO> listExamTeacher(String examId) {
        if (StringUtils.isBlank(examId)){
            //若examId为空则返回所有年级的所有教师
            return typeMapper.mapList(teacherInfoViewMapper.selectAll(), TeacherSimpleVO.class);
        }

        ExamPO examPO = this.getExamById(examId);
        String gradeId = examPO.getGradeId();

        Example example = new Example(TeacherInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("gradeId", gradeId);
        List<TeacherInfoViewPO> teacherInfoViewPOList = teacherInfoViewMapper.selectByExample(example);
        return typeMapper.mapList(teacherInfoViewPOList, TeacherSimpleVO.class);
    }

    @Override
    public List<StudentSimpleVO> listExamStudent(String examId) {
        if (StringUtils.isBlank(examId)){
            return Lists.newArrayList();
        }
        ExamPO examPO = this.getExamById(examId);
        String gradeId = examPO.getGradeId();

        Example example = new Example(StudentInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("gradeId", gradeId);
        List<StudentInfoViewPO> studentInfoViewPOList = studentInfoViewMapper.selectByExample(example);

        return typeMapper.mapList(studentInfoViewPOList, StudentSimpleVO.class);
    }

    @Override
    public ListResultVO listExam(MetaData metaData){
        Example example = new Example(ExamInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("examType"))){
                criteria.andEqualTo("examType", metaData.getFilter().get("examType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("examState"))){
                criteria.andEqualTo("examState", metaData.getFilter().get("examState"));
            }
        }

        if (Objects.nonNull(metaData) && (!metaData.getExt().isEmpty())){
            List<String> ext = metaData.getExt();
            String e = "%"+ext.get(0)+"%";
            if (!e.equals("")){
                criteria.andLike("name", e);
                criteria.orLike("eNo", e);
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
        PageInfo<ExamInfoViewPO> pageInfo = new PageInfo<>(examInfoViewMapper.selectByExample(example));

        List<ExamInfoViewPO> examInfoViewPOList = pageInfo.getList();
        List<ExamVO> result = Lists.newArrayList();
        for (ExamInfoViewPO examInfoViewPO : examInfoViewPOList){
            ExamVO examVO = typeMapper.map(examInfoViewPO, ExamVO.class);
            examVO.setExamType(TypeVO.builder().typeCode(examInfoViewPO.getExamType()).typeDescription(ExamTypeEnum.descriptionOf(examInfoViewPO.getExamType())).build());
            examVO.setExamState(TypeVO.builder().typeCode(examInfoViewPO.getExamState()).typeDescription(ExamStateEnum.descriptionOf(examInfoViewPO.getExamState())).build());
            result.add(examVO);
        }

        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }

    @Override
    public List<ExamVO> listExamAll(String keyword){
        Example example = new Example(ExamInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtils.isNotBlank(keyword)){
            String e = "%"+keyword+"%";
            criteria.andLike("name", e);
            criteria.andLike("eNo", e);
        }

        List<ExamInfoViewPO> examInfoViewPOList = examInfoViewMapper.selectByExample(example);

        List<ExamVO> result = Lists.newArrayList();
        for (ExamInfoViewPO examInfoViewPO : examInfoViewPOList){
            ExamVO examVO = typeMapper.map(examInfoViewPO, ExamVO.class);
            examVO.setExamType(TypeVO.builder().typeCode(examInfoViewPO.getExamType()).typeDescription(ExamTypeEnum.descriptionOf(examInfoViewPO.getExamType())).build());
            examVO.setExamState(TypeVO.builder().typeCode(examInfoViewPO.getExamState()).typeDescription(ExamStateEnum.descriptionOf(examInfoViewPO.getExamState())).build());
            result.add(examVO);
        }

        return result;
    }

    @Override
    public List<SimpleVO> listExamClazz(String examId){
        ExamPO examPO = examMapper.selectByPrimaryKey(examId);
        String gradeId = examPO.getGradeId();

        Example example = new Example(ClazzInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("gradeId", gradeId);
        List<ClazzInfoViewPO> clazzInfoViewPOList = clazzInfoViewMapper.selectByExample(example);

        List<SimpleVO> result = Lists.newArrayList();
        for (ClazzInfoViewPO clazzInfoViewPO : clazzInfoViewPOList){
            SimpleVO simpleVO = typeMapper.map(clazzInfoViewPO, SimpleVO.class);
            simpleVO.setNo(clazzInfoViewPO.getClNo());
            result.add(simpleVO);
        }

        return result;
    }

    @Transactional
    @Override
    public ResultCop deleteExam(String ...ids){
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        ExamPO examExample = new ExamPO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                examExample.setId(id);
                ExamPO exist = examMapper.selectByPrimaryKey(examExample);
                if (Objects.isNull(exist)){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                //TODO: 删除exam_subject

                //TODO: 删除exam_teacher_marking

                //TODO: 删除exam_teacher_inviglate

                //TODO: 删除exam_teac_inv_room_middle

                //TODO: 删除exam_room

                //TODO: 删除exam_subject_student 和 exam_score;

                //TODO: 删除exam
            }
        } catch (RuntimeException e){
            e.printStackTrace();
            res.setIsSuccess(ResultCop.FAILED);
            res.setDescription("error index: -"+index);
            res.setWarnTag(ResultCop.NOT_WARN);
            return res;
        }

        res.setIsSuccess(ResultCop.SUCCESS);
        res.setDescription("/r/n success: " + successCount + ", r/n invalid: " + notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }


    private ExamPO getExamById (String examId) {
        Example example = new Example(ExamPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("id", examId);

        return examMapper.selectOneByExample(example);
    }


}
