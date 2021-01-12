package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.CourseEditDTO;
import com.happystudy2.happystudy2management.domain.vo.CourseVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.CourseService;
import com.happystudy2.happystudy2management.service.TeacherService;
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
@RequestMapping(UrlMap.COURSE_CONTROLLER)
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private ObjFormatter objFormatter;

    @RequestMapping("")
    public String index(){
        return "course/course_man";
    }

    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "course/form/courseBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "course/form/courseBaseInfoEdit";
    }
    @RequestMapping("/showcourseMsg")
    public String getModal(@RequestParam Map<String, Object> course, HttpServletRequest request){
        request.setAttribute("course", course);
        for (String key : course.keySet()){
            request.setAttribute(key, course.get(key));
        }
        return "course/BTModal/coursetDetail";
    }

    @GetMapping("list/courseAbleTeacher")
    @ResponseBody
    public ResultData<TeacherSimpleVO> getCourseAbleTeacher(){
        List<TeacherSimpleVO> result = courseService.listCourseAbleTeacher();
        ResultDataFactory factory = new ResultDataFactory(result);
        return factory.success();
    }

    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap);

        ListResultVO resultVO = courseService.listCourse(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<CourseVO> doAddCourse(@RequestBody CourseEditDTO courseEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(courseEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            CourseVO courseVO = courseService.addCourse(courseEditDTO);
            return factory.success("添加成功! " + courseVO.getCoNo() + "- " + courseVO.getName());
        } catch (IllegalAccessException e){
            e.printStackTrace();
            return factory.error("添加失败: 系统故障");
        } catch (BussinessExcecption e){
            e.printStackTrace();
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<CourseVO> doUpdateCourse(@RequestBody CourseEditDTO courseEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (StringUtils.isBlank(courseEditDTO.getId())){
                return factory.error("修改失败: 缺少参数");
            }
            courseEditDTO.setClazzId(null);
            courseEditDTO.setSubjectId(null);
            if (StringUtils.isBlank(courseEditDTO.getRemark())){
                courseEditDTO.setRemark(null);
            }
            if (StringUtils.isBlank(courseEditDTO.getTeacherId())){
                courseEditDTO.setTeacherId(null);
            }
            CourseVO courseVO = courseService.updateCourse(courseEditDTO);
            return factory.success("修改成功! " + courseVO.getCoNo()+ "- " + courseVO.getName());
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteCourse(@RequestParam("courseIds") String courseIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(courseIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(courseIds);
        ResultCop res = courseService.deleteCourse(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " +  res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败，存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

}
