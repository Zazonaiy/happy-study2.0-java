package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(UrlMap.STUDENT_CONTROLLER)
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("")
    public String index(){
        return "student/student_man";
    }

    @RequestMapping("add-baseinfo")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "student/form/stuBaseInfoEdit";
    }
    @RequestMapping("update-baseinfo")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "student/form/stuBaseInfoEdit";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResultData<StudentVO> list(){
        List<StudentVO> studentVOList = studentService.listStudent();
        ResultDataFactory factory = new ResultDataFactory(studentVOList);
        return factory.success();
    }
}
