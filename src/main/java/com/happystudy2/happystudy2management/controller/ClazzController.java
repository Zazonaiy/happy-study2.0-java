package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ClazzTypeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.ClazzEditDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.view.ClazzInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.*;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.ClazzService;
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
@RequestMapping(UrlMap.CLAZZ_CONTROLLER)
public class ClazzController {
    @Autowired
    private ClazzService clazzService;
    @Autowired
    private ObjFormatter objFormatter;
    @Autowired
    private TypeMapper typeMapper;

    @RequestMapping("")
    public String index(){
        return "clazz/clazz_man";
    }

    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "clazz/form/clazzBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "clazz/form/clazzBaseInfoEdit";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "gradeType", "gradeId", "clazzType");
        ListResultVO resultVO = clazzService.listClazz(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("/editdata/baseinfo/listClazzMasterAbleTeacher")
    @ResponseBody
    public ResultData<TeacherSimpleVO> listClazzMasterAbleTeacher(){
        List<TeacherSimpleVO> result = clazzService.listClazzMasterAbleTeacher();
        ResultDataFactory factory = new ResultDataFactory(result);
        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<ClazzVO> doAddClazz(@RequestBody ClazzEditDTO clazzEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(clazzEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            ClazzVO clazzVO = clazzService.addClazz(clazzEditDTO);
            return factory.success("添加成功! "+clazzVO.getClNo()+ "- "+clazzVO.getName());

        } catch (IllegalAccessException e){
            e.printStackTrace();
            return factory.error("添加失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<ClazzVO> doUpdateClazz(@RequestBody ClazzEditDTO clazzEditDTO) {
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(clazzEditDTO)){
                return factory.error("修改失败: 缺少参数");
            }
            ClazzVO clazzVO = clazzService.updateClazz(clazzEditDTO);
            return factory.success("修改成功! "+clazzVO.getClNo()+ "- "+clazzVO.getName());
        }catch (IllegalAccessException e){
            e.printStackTrace();
            return factory.error("修改失败: 系统故障");
        } catch (BussinessExcecption e){
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteClazz(@RequestParam("clazzIds") String clazzIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(clazzIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(clazzIds);
        ResultCop res = clazzService.deleteClazz(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " + res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败，存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

    @GetMapping("/list/clazzType")
    @ResponseBody
    public ResultData<TypeVO> listClazzType(){
        ResultDataFactory factory = new ResultDataFactory();
        for (ClazzTypeEnum clazzTypeEnum : ClazzTypeEnum.values()){
            factory.addData(TypeVO.builder().typeCode(clazzTypeEnum.getCode()).typeDescription(ClazzTypeEnum.descriptionOf(clazzTypeEnum.getCode())).build());
        }

        return factory.success();
    }

    @GetMapping("list/{gradeId}")
    @ResponseBody
    public ResultData<ClazzVO> listClazzByGradeId(@PathVariable("gradeId") String gradeId){
        List<ClazzVO> clazzVOList = clazzService.listByGrade(gradeId);
        ResultDataFactory factory = new ResultDataFactory(clazzVOList);
        return factory.success();
    }
}
