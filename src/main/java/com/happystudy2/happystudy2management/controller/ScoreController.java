package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ScoreTypeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.domain.dto.score.ScoreEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreEditVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.ExamService;
import com.happystudy2.happystudy2management.service.ScoreService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping(UrlMap.SCORE_CONTROLLER)
public class ScoreController {
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private ExamService examService;
    @Autowired
    private ObjFormatter objFormatter;

    @RequestMapping("")
    public String index(){
        return "score/score_imp";
    }
    @RequestMapping("/baseInfo")
    public String baseInfo(){
        return "score/scoreBaseInfo";
    }
    @RequestMapping("/showScoreMsg")
    public String showMsgModal(){
        //TODO:
        //request.setAttribute("score", score);
        //for (String key : score.keySet()){
        //    request.setAttribute(key, score.get(key));
        //}
        return "score/BTModal/scoreDetail";
    }
    @RequestMapping("editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "score/form/scoreBaseInfoEdit";
    }
    @RequestMapping("editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "score/form/scoreBaseInfoEdit";
    }

    @GetMapping("/list/{examId}")
    @ResponseBody
    public ResultData<ExamScoreVO> list(@RequestParam Map<String, Object> paramMap, @PathVariable("examId") String examId){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "scoreType", "clazzId");

        ListResultVO resultVO = scoreService.listScore(metaData, examId);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("/list/scoreType")
    @ResponseBody
    public ResultData<TypeVO> listExamType(){
        ResultDataFactory factory = new ResultDataFactory();

        for (ScoreTypeEnum e : ScoreTypeEnum.values()){

            TypeVO typeVO = TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build();
            factory.addData(typeVO);
        }

        return factory.success();
    }

    @GetMapping("list/subjectStudent/{examId}")
    @ResponseBody
    public ResultData<SimpleVO> listSubjectStudent (@PathVariable("examId")String examId, String examSubjectId){

        if (StringUtils.isBlank(examSubjectId)){
            //List<StudentSimpleVO> studentSimpleVOList = examService.listExamStudent(examId);
            //ResultDataFactory factory = new ResultDataFactory(studentSimpleVOList);
            ResultDataFactory factory = new ResultDataFactory();
            return factory.error("缺少考试科目");
        }
        List<SimpleVO> simpleVOList = scoreService.listSubjectStudentWithoutScore(examSubjectId);
        ResultDataFactory factory = new ResultDataFactory(simpleVOList);

        return factory.success();
    }


    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<ExamScoreEditVO> doAddScore(@RequestBody ScoreEditDTO scoreEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (Objects.isNull(scoreEditDTO.getScore())){
                return factory.error("添加失败: 缺少参数");
            }
            //TODO: 判断用户角色权限
            ExamScoreEditVO examScoreEditVO = scoreService.addScore(scoreEditDTO);
            //return factory.success("添加成功! 学生:"+scoreEditVO+ " 科目:"+scoreEditVO.getExamSubjectName()
            //        +" 成绩:"+scoreEditVO.getScore);
            return factory.success("添加成功！");
        //} catch (IllegalAccessException e){
        //    return factory.error("添加失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<ExamScoreEditVO> doUpdateScore(@RequestBody ScoreEditDTO scoreEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (Objects.isNull(scoreEditDTO.getScore())){
                return factory.error("修改失败: 缺少参数");
            }
            //TODO: 判断用户角色权限
            //TODO: 一般member申请改成绩提示申请成功，改卷教师修改成绩提示修改成功
            ExamScoreEditVO examScoreEditVO = scoreService.updateScore(scoreEditDTO);
            return null;

        //} catch (IllegalAccessException e){
        //    return factory.error("修改失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

}
