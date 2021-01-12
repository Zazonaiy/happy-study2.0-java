package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.TeacherTypeEnum;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.TeacherEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.TeacherService;
import com.happystudy2.happystudy2management.util.ObjReflectUtil;
import com.happystudy2.happystudy2management.util.StringBussinessUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(UrlMap.TEACHER_CONTROLLER)
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ObjFormatter objFormatter;
    @Autowired
    private TypeMapper typeMapper;

    @RequestMapping("")
    public String index(){
        return "teacher/teacher_man";
    }
    @RequestMapping("/showTeacherMsg")
    public String getModal(@RequestParam Map<String, Object> teacher, HttpServletRequest request){
        return "teacher/BTModal/teacherDetail";
    }
    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "teacher/form/teacherBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "teacher/form/teacherBaseInfoEdit";
    }


    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "gradeType", "teacherType");
        ListResultVO resultVO = teacherService.listTeacher(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @PostMapping("/import")
    @ResponseBody
    public ResultData<TeacherVO> importTeacher(MultipartFile excel, HttpServletRequest request){
        //TODO :
        return null;
    }

    @GetMapping("/list/teacherType")
    @ResponseBody
    public ResultData<TypeVO> listteacherType(){
        ResultDataFactory factory = new ResultDataFactory();
        for (TeacherTypeEnum teacherTypeEnum : TeacherTypeEnum.values()){
            factory.addData(TypeVO.builder().typeCode(teacherTypeEnum.getCode()).typeDescription(teacherTypeEnum.getDescription()).build());
        }

        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<TeacherVO> doAddTeacher(@RequestBody TeacherEditDTO teacherEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(teacherEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            TeacherVO teacherVO = teacherService.addTeacher(teacherEditDTO);
            return factory.success("添加成功! "+teacherVO.getTNo()+ "- "+teacherVO.getName());

        } catch (IllegalAccessException e){
            return factory.error("添加失败: 系统故障");
        }
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<TeacherVO> doUpdateTeacher(@RequestBody TeacherEditDTO teacherEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(teacherEditDTO)){
                return factory.error("修改失败: 缺少参数");
            }
            TeacherVO teacherVO = teacherService.updateTeacher(teacherEditDTO);
            return factory.success("修改成功! "+teacherVO.getTNo()+ "- "+teacherVO.getName());

        } catch (IllegalAccessException e){
            return factory.error("修改失败: 系统故障");
        }
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteTeacher(@RequestParam("teacherIds") String teacherIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(teacherIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(teacherIds);
        ResultCop res = teacherService.deleteTeacher(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " + res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败, 存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

}
