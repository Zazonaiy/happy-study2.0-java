package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ExamStateEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ExamTypeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistDTO;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistMemberDTO;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistTaskDTO;
import com.happystudy2.happystudy2management.domain.vo.*;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamRoomVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSubjectVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.ExamService;
import com.happystudy2.happystudy2management.util.StringBussinessUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping(UrlMap.EXAM_CONTROLLER)
public class ExamController {
    @Autowired
    private ExamService examService;
    @Autowired
    private ObjFormatter objFormatter;
    @Autowired
    private TypeMapper typeMapper;

    @RequestMapping("")
    public String index(){
        return "exam/exam_man";
    }
    @RequestMapping(UrlMap.EXM_REGIST)
    public String createExamProcessIndex(){
        return "exam/process/createExam/index";
    }
    @RequestMapping(UrlMap.EXM_REGIST+"/baseinfo")
    public String getcreateExamProcessBaseinfo(){
        return "exam/process/createExam/examBaseInfo";
    }
    @RequestMapping(UrlMap.EXM_REGIST+"/room")
    public String getcreateExamProcessRoom(){
        return "exam/process/createExam/examRoomConfig";
    }
    @RequestMapping(UrlMap.EXM_REGIST+"/subject")
    public String getcreateExamProcessSubject(){
        return "exam/process/createExam/examSubjectConfig";
    }
    @RequestMapping(UrlMap.EXM_REGIST+"/member")
    public String getcreateExamProcessMember(){
        return "exam/process/createExam/examMemberConfig";
    }
    @RequestMapping(UrlMap.EXM_REGIST+"/task")
    public String getcreateExamProcessTask(){
        return "exam/process/createExam/examTaskConfig";
    }


    @PostMapping("/regist/firstStep")
    @ResponseBody
    public ResultData<BaseVO> registExamStepOneDo (@RequestBody ExamRegistDTO examRegistDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            ResultCop resultCop = examService.examRegistBase(examRegistDTO);
            if (resultCop.getIsSuccess()){
                SimpleVO simpleVO = new SimpleVO();
                simpleVO.setId(resultCop.getDescription());
                factory.addData(simpleVO);
                return factory.success("流程创建成功！-开设考试");
            }else{
                return factory.error("流程创建失败！-开设考试");
            }
        } catch (Exception e){
            e.printStackTrace();
            return factory.error("流程创建失败！系统错误");
        }

    }
    @PostMapping("/regist/{examId}")
    @ResponseBody
    public ResultData<BaseVO> registExamStepOneUpdate (@PathVariable("examId") String examId, @RequestBody ExamRegistDTO examRegistDTO){
        ResultDataFactory factory = new ResultDataFactory();

        return null;
    }
    @PostMapping("/regist/secondStep")
    @ResponseBody
    public ResultData<BaseVO> registExamStepTwoDo (@RequestBody ExamRegistMemberDTO examRegistMemberDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            ResultCop resultCop = examService.examRegistMemberConfig(examRegistMemberDTO);
            if (resultCop.getIsSuccess()){
                return factory.success("流程创建成功！人员配置详情："+resultCop.getDescription());
            }else{
                return factory.error("流程创建失败！人员配置详情："+resultCop.getDescription());
            }
        } catch (BussinessExcecption e){
            e.printStackTrace();
            return factory.error("流程创建失败！系统错误");
        }

    }

    @PostMapping("/regist/thirdStep")
    @ResponseBody
    public ResultData<BaseVO> registExamStepThirdDo(@RequestBody ExamRegistTaskDTO examRegistTaskDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            ResultCop resultCop = examService.examRegistTaskConfig(examRegistTaskDTO);
            if (resultCop.getIsSuccess()){
                return factory.success(resultCop.getDescription());
            }else{
                return factory.error(resultCop.getDescription());
            }
        } catch (BussinessExcecption e){
            e.printStackTrace();
            return factory.error("流程创建失败！系统错误");
        }

    }

    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "examType", "examState");

        ListResultVO resultVO = examService.listExam(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("list/all/{keyword}")
    @ResponseBody
    public ResultData<ExamVO> listAll(@PathVariable("keyword") String keyword){
        List<ExamVO> resultVO = examService.listExamAll(keyword);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }
    @GetMapping("list/all")
    @ResponseBody
    public ResultData<ExamVO> listAll(){
        List<ExamVO> resultVO = examService.listExamAll("");
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("/list/examType")
    @ResponseBody
    public ResultData<TypeVO> listExamType(){
        ResultDataFactory factory = new ResultDataFactory();

        for (ExamTypeEnum e : ExamTypeEnum.values()){

            TypeVO typeVO = TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build();
            factory.addData(typeVO);
        }

        return factory.success();

    }

    @GetMapping("/list/examState")
    @ResponseBody
    public ResultData<TypeVO> listExamState(){
        ResultDataFactory factory = new ResultDataFactory();

        for (ExamStateEnum e : ExamStateEnum.values()){
            TypeVO typeVO = TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build();
            factory.addData(typeVO);
        }

        return factory.success();

    }

    @GetMapping("/list/byState/creating/{gradeId}")
    @ResponseBody
    public ResultData<ExamSimpleVO> listCreatingExam(@PathVariable("gradeId")String gradeId){
        List<ExamSimpleVO> simpleVOList = examService.listCreatingExamByGrade(gradeId);
        if (Objects.isNull(simpleVOList)){
            ResultDataFactory factory = new ResultDataFactory();
            return factory.error("缺少参数");
        }
        ResultDataFactory factory = new ResultDataFactory(simpleVOList);
        return factory.success();
    }

    @GetMapping("/list/subject/{examId}")
    @ResponseBody
    public ResultData<ExamSubjectVO> listExamSubject (@PathVariable("examId")String examId){
        List<ExamSubjectVO> subjectVOList = examService.listExamSubject(examId);
        ResultDataFactory factory = new ResultDataFactory(subjectVOList);

        return factory.success();
    }

    @GetMapping("/list/room/{examId}")
    @ResponseBody
    public ResultData<ExamRoomVO> listExamRoom (@PathVariable("examId") String examId){
        List<ExamRoomVO> roomVOList = examService.listExamRoom(examId);
        ResultDataFactory factory = new ResultDataFactory(roomVOList);

        return factory.success();
    }

    @GetMapping("/list/teacher/{examId}")
    @ResponseBody
    public ResultData<TeacherSimpleVO> listExamTeacher(@PathVariable("examId") String examId){
        List<TeacherSimpleVO> teacherSimpleVOList = examService.listExamTeacher(examId);
        ResultDataFactory factory = new ResultDataFactory(teacherSimpleVOList);

        return factory.success();
    }

    @GetMapping("/list/student/{examId}")
    @ResponseBody
    public ResultData<StudentSimpleVO> listExamStudent(@PathVariable("examId") String examId) {
        List<StudentSimpleVO> studentSimpleVOList = examService.listExamStudent(examId);
        ResultDataFactory factory = new ResultDataFactory(studentSimpleVOList);

        return factory.success();
    }

    @GetMapping("/list/clazz/{examId}")
    @ResponseBody
    public ResultData<SimpleVO> listExamClazz(@PathVariable("examId") String examId){
        List<SimpleVO> clazzSimpleVOList = examService.listExamClazz(examId);
        ResultDataFactory factory = new ResultDataFactory(clazzSimpleVOList);

        return factory.success();
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteExam(@RequestParam("examIds") String examIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(examIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(examIds);
        ResultCop res = examService.deleteExam(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " + res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败, 存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

}
