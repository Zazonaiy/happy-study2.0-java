package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SubjectTypeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.SubjectEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SubjectVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.SubjectService;
import com.happystudy2.happystudy2management.service.TaskService;
import com.happystudy2.happystudy2management.util.ObjReflectUtil;
import com.happystudy2.happystudy2management.util.StringBussinessUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(UrlMap.SUBJECT_CONTROLLER)
public class SubjectController {

    @Autowired
    private SubjectService subjectService;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private ObjFormatter objFormatter;
    @Autowired
    private TaskService taskService;


    @RequestMapping("")
    public String index() {
        //taskService.test();
        //taskService.test2();
        //WebSocket.sendMessage("消息来了");
        return "subject/subject_man";
    }

    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        taskService.test3();
        return "subject/form/subjectBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "subject/form/subjectBaseInfoEdit";
    }

    @GetMapping("/list/subjectType")
    @ResponseBody
    public ResultData<TypeVO> listSubjectType(){
        ResultDataFactory factory = new ResultDataFactory();

        for (SubjectTypeEnum subjectTypeEnum : SubjectTypeEnum.values()){
            factory.addData(TypeVO.builder().typeCode(subjectTypeEnum.getCode()).typeDescription(subjectTypeEnum.getDescription()).build());
        }

        return factory.success();
    }

    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "gradeType", "subjectType");

        ListResultVO resultVO = subjectService.listSubject(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<SubjectVO> doAddSubject(@RequestBody SubjectEditDTO subjectEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(subjectEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            SubjectVO subjectVO = subjectService.addSubject(subjectEditDTO);
            return factory.success("添加成功! " + subjectVO.getSubNo() + "- " + subjectVO.getName());
        } catch (IllegalAccessException e){
            return factory.error("添加失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("添加失败: " + e.getErrorCode());
        }
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<SubjectVO> doUpdateSubject(@RequestBody SubjectEditDTO subjectEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(subjectEditDTO)){
                return factory.error("修改失败: 缺少参数");
            }
            SubjectVO subjectVO = subjectService.updateSubject(subjectEditDTO);
            return factory.success("修改成功! " + subjectVO.getSubNo() + "- " + subjectVO.getName());
        } catch (IllegalAccessException e){
            return factory.error("修改失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteSubject(@RequestParam("subjectIds") String subjectIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(subjectIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(subjectIds);
        ResultCop res = subjectService.deleteSubject(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " +  res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败，存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

    @GetMapping("/list/-{subjectType}")
    @ResponseBody
    public ResultData<SubjectVO> getSubjectByType(@PathVariable("subjectType") String subjectType){
        Integer typeCode = null;
        if (StringUtils.isNotBlank(subjectType)){
            typeCode = Integer.parseInt(subjectType);
        }

        List<SubjectVO> subjectVOList = subjectService.listSubjectByType(typeCode);

        ResultDataFactory factory = new ResultDataFactory(subjectVOList);
        return factory.success();
    }

    @GetMapping("/query/subjectType/{subjectId}")
    @ResponseBody
    public ResultData<TypeVO> getSubjectTypeById(@PathVariable("subjectId") String subjectId){
        if (StringUtils.isBlank(subjectId)){
            ResultDataFactory factory = new ResultDataFactory(TypeVO.builder().build());
            return factory.warning("subjectId为空");
        }

        TypeVO typeVO = subjectService.getSubjectTypeById(subjectId);
        ResultDataFactory factory = new ResultDataFactory(typeVO);
        return factory.success();
    }

}
