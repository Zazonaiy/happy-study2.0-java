package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.domain.vo.SemesterVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(UrlMap.SEMESTER_CONTROLLER)
public class SemesterController {
    @Autowired
    private SemesterService semesterService;

    @GetMapping("/list/all")
    @ResponseBody
    public ResultData<SemesterVO> allSemester(){
        List<SemesterVO> semesterVOList = semesterService.listAll();
        ResultDataFactory resultDataFactory = new ResultDataFactory(semesterVOList);
        return resultDataFactory.success();
    }

}
