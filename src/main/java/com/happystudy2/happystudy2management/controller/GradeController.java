package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.GradeEditDTO;
import com.happystudy2.happystudy2management.domain.dto.StudentEditDTO;
import com.happystudy2.happystudy2management.domain.vo.*;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.GradeService;
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
@RequestMapping(UrlMap.GRADE_CONTROLLER)
public class GradeController {

    @Autowired
    private GradeService gradeService;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private ObjFormatter objFormatter;


    @RequestMapping("")
    public String index() { return "grade/grade_man"; }

    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "grade/form/gradeBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "grade/form/gradeBaseInfoEdit";
    }

    @RequestMapping("/showGradeMsg")
    public String getModal(@RequestParam Map<String, Object> grade, HttpServletRequest request){
        request.setAttribute("grade", grade);
        for (String key : grade.keySet()){
            request.setAttribute(key, grade.get(key));
        }
        return "grade/BTModal/gradeDetail";
    }


    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "gradeType");

        ListResultVO resultVO = gradeService.listGrade(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("/editdata/baseinfo/listGradeMasterAbleTeacher")
    @ResponseBody
    public ResultData<TeacherSimpleVO> listGradeMasterAbleTeacher(){
        List<TeacherSimpleVO> result = gradeService.listGradeMasterAbleTeacher();
        ResultDataFactory factory = new ResultDataFactory(result);
        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<GradeEditVO> doAddGrade(@RequestBody GradeEditDTO gradeEditDTO) {
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(gradeEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            GradeVO gradeVO = gradeService.addGrade(gradeEditDTO);
            return factory.success("添加成功! "+gradeVO.getGNo()+ "- "+gradeVO.getName());

        } catch (IllegalAccessException e){
            return factory.error("添加失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }

        //return factory.success("添加成功!");
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<GradeEditVO> doUpdateGrade(@RequestBody GradeEditDTO gradeEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(gradeEditDTO)){
                return factory.error("修改失败: 缺少参数");
            }
            GradeVO gradeVO = gradeService.updateGrade(gradeEditDTO);
            return factory.success("修改成功! "+gradeVO.getGNo()+ "- "+gradeVO.getName());

        } catch (IllegalAccessException e){
            return factory.error("修改失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteGrade(@RequestParam("gradeIds") String gradeIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(gradeIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(gradeIds);
        ResultCop res = gradeService.deleteGrade(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " +  res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败，存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }


}
