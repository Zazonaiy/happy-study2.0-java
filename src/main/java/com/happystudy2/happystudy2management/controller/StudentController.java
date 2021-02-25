package com.happystudy2.happystudy2management.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.alibaba.fastjson.JSONObject;
import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.GradeTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SexEnum;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.ObjFormatter;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.StudentEditDTO;
import com.happystudy2.happystudy2management.domain.dto.StudentImportDTO;
import com.happystudy2.happystudy2management.domain.vo.*;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.service.ClazzService;
import com.happystudy2.happystudy2management.service.GradeService;
import com.happystudy2.happystudy2management.service.StudentService;
import com.happystudy2.happystudy2management.util.ObjReflectUtil;
import com.happystudy2.happystudy2management.util.StringBussinessUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(UrlMap.STUDENT_CONTROLLER)
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private ClazzService clazzService;
    @Autowired
    private ObjFormatter objFormatter;
    @Autowired
    private TypeMapper typeMapper;

    @RequestMapping("")
    public String index(){
        return "student/student_man2";
    }

    @RequestMapping("/editform/baseinfo/add")
    public String getAddForm(HttpServletRequest request){
        request.setAttribute("action", "add");
        return "student/form/stuBaseInfoEdit";
    }
    @RequestMapping("/editform/baseinfo/update")
    public String getUpdateForm(HttpServletRequest request){
        request.setAttribute("action", "update");
        return "student/form/stuBaseInfoEdit";
    }

    @RequestMapping("/showStuMsg")
    public String getModal(@RequestParam Map<String, Object> student, HttpServletRequest request){
        request.setAttribute("student", student);
        for (String key : student.keySet()){
            request.setAttribute(key, student.get(key));
        }
        return "student/BTModal/studentDetail";
    }

    //@RequestMapping("/score")
    //public String indexTest2(){
    //    return "student/student_man2";
    //}


    @GetMapping("/list")
    @ResponseBody
    public ResultData<ListResultVO> list(@RequestParam Map<String, Object> paramMap){
        MetaData metaData = objFormatter.MapToMetaData(paramMap, "sex", "gradeType", "gradeId");
        //List<StudentVO> studentVOList = studentService.listStudent(metaData);

        //List<StudentVO> test = studentService.pageHelperTest();

        //ListResultVO resultVO = ListResultVO.builder().resList(studentVOList).paginationParam(metaData.getPaginationParam()).build();
        ListResultVO resultVO = studentService.listStudent(metaData);
        ResultDataFactory factory = new ResultDataFactory(resultVO);
        return factory.success();
    }

    @GetMapping("/editdata/baseinfo/add")
    @ResponseBody
    public ResultData<StudentEditVO> getAddFormData(){
        List<GradeVO> gradeList = gradeService.listAll();
        StudentEditVO studentEditVO = StudentEditVO.builder().gradeList(gradeList).build();

        ResultDataFactory factory = new ResultDataFactory(studentEditVO);
        return factory.success();
    }

    @GetMapping("/list/gradeType/{gradeType}")
    @ResponseBody
    public ResultData<StudentEditVO> listGradeByGradeType(@PathVariable("gradeType") String gradeType){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(gradeType)){
            return factory.error("gradeType为空");
        }

        List<GradeVO> gradeVOList = gradeService.listByGradeType(Integer.parseInt(gradeType));
        StudentEditVO studentEditVO = StudentEditVO.builder().gradeList(gradeVOList).build();
        factory.addData(studentEditVO);
        return factory.success();
    }

    @GetMapping("/editdata/baseinfo/add/{gradeId}")
    @ResponseBody
    public ResultData<StudentEditVO> getAddFormData(@PathVariable("gradeId") String gradeId){
        List<ClazzVO> clazzList = clazzService.listByGrade(gradeId);
        StudentEditVO studentEditVO = StudentEditVO.builder().clazzList(clazzList).build();

        ResultDataFactory factory = new ResultDataFactory(studentEditVO);
        return factory.success();
    }

    @PostMapping("/doEdit/baseinfo/add")
    @ResponseBody
    public ResultData<StudentEditVO> doAddStudent(@RequestBody StudentEditDTO studentEditDTO) {
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(studentEditDTO)){
                return factory.error("添加失败: 缺少参数");
            }
            StudentVO studentVO = studentService.addStudent(studentEditDTO);
            return factory.success("添加成功! "+studentVO.getSNo()+ "- "+studentVO.getName());

        } catch (IllegalAccessException e){
            return factory.error("添加失败: 系统故障");
        }

        //return factory.success("添加成功!");
    }

    @DeleteMapping("/doEdit/baseinfo/delete")
    @ResponseBody
    public ResultData<BaseVO> doDeleteStudent(@RequestParam("studentIds") String studentIds){
        ResultDataFactory factory = new ResultDataFactory();
        if (StringUtils.isBlank(studentIds)){
            return factory.error("删除失败: 缺少参数");
        }

        String[] idZoon = StringBussinessUtil.splitIds(studentIds);
        ResultCop res = studentService.deleteStudent(idZoon);

        if (!res.getIsSuccess()){
            return factory.error("删除失败: " + res.getDescription());
        }

        if (res.getWarnTag()){
            return factory.warning("删除失败，存在无效条目: " + res.getDescription());
        }

        return factory.success("删除成功: " + res.getDescription());
    }

    @PostMapping("/doEdit/baseinfo/update")
    @ResponseBody
    public ResultData<StudentEditVO> doUpdateStudent(@RequestBody StudentEditDTO studentEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (!ObjReflectUtil.fieldAllFilledWithoutFather(studentEditDTO)){
                return factory.error("修改失败: 缺少参数");
            }
            StudentVO studentVO = studentService.updateStudent(studentEditDTO);
            return factory.success("修改成功! "+studentVO.getSNo()+ "- "+studentVO.getName());
        } catch (IllegalAccessException e){
            return factory.error("修改失败: 系统故障");
        }
    }

    @PostMapping("/import")
    @ResponseBody
    public ResultData<StudentVO> importStudent(MultipartFile excel, HttpServletRequest request){
        StringBuffer resultMsg = new StringBuffer();
        ResultDataFactory factory = new ResultDataFactory();
        try{
            if (excel.isEmpty()){
                resultMsg.append("error: 文件为空");
                return factory.warning(resultMsg.toString());
            }
            String fileName = excel.getOriginalFilename();
            String filePath = "G:/happy_study2/fileupload/studentBaseInfo/import/";
            String uuid = IdUtil.fastSimpleUUID();
            File dir = new File(filePath + uuid + "/");
            if (!dir.exists()){
                dir.mkdirs();
            }
            File dest = new File(filePath + uuid + "/" + fileName);
            excel.transferTo(dest);
            ExcelReader reader = ExcelUtil.getReader(dest);
            List<Map<String, Object>> readAll = reader.readAll();
            List<StudentImportDTO> stuList = new ArrayList<>();
            for (Map<String, Object> data : readAll){
                StudentImportDTO studentImportDTO = parseStudent(data);
                stuList.add(studentImportDTO);
            }
            reader.close();
            FileUtil.del(dest);

            String resMsg = studentService.addStudentBatch(stuList);
            if (resMsg.split(" ")[0].equals("success")){
                resultMsg.append("success: " + resMsg);
                return factory.success("success: add student row: "+ stuList.size());
            }else{
                resultMsg.append( resultMsg.toString());
                return factory.error(resultMsg.toString());
            }
        } catch (IOException e){
            e.printStackTrace();
            resultMsg.append("error: 文件导入失败！" );
            return factory.error(resultMsg.toString());
        }
    }
    private static final Map<String, String> TITLE_MAP = new HashMap<>();
    static {
        TITLE_MAP.put("姓名", "name");
        TITLE_MAP.put("性别", "sex");
        TITLE_MAP.put("生日", "birthday");
        TITLE_MAP.put("职责", "respType");
        TITLE_MAP.put("班级号", "clazzNo");
        TITLE_MAP.put("父亲姓名", "fatherName");
        TITLE_MAP.put("父亲电话号码", "fatherPhone");
        TITLE_MAP.put("母亲姓名", "motherName");
        TITLE_MAP.put("母亲电话号码", "motherPhone");
        TITLE_MAP.put("紧急联系人姓名", "emContactName");
        TITLE_MAP.put("紧急联系人电话号码", "emContactPhone");
        TITLE_MAP.put("备注", "remark");
    }
    private StudentImportDTO parseStudent(Map<String, Object> studentMap){
        Set<String> keySet = studentMap.keySet();
        JSONObject jsonObject = new JSONObject();
        for (String key : keySet){
            String DTOKey = TITLE_MAP.get(key);
            Object stuAttr = studentMap.get(key);
            if (stuAttr instanceof Date){
                stuAttr = DateUtil.format((Date)stuAttr, "yyyy-MM-dd").split(" ")[0];
            }
            if (DTOKey.equals("sex")){
                stuAttr = (Integer) SexEnum.codeOf(((String)stuAttr).replace(" ", ""));
            }
            if (DTOKey.equals("clazzNo")){
                stuAttr = objFormatter.objectToInteger(studentMap.get(key));
            }
            jsonObject.put(DTOKey, stuAttr);
        }

        return typeMapper.map(jsonObject, StudentImportDTO.class);
    }

    @GetMapping("/list/gradeType")
    @ResponseBody
    public ResultData<TypeVO> listGradeType(){
        ResultDataFactory factory = new ResultDataFactory();
        for (GradeTypeEnum gradeTypeEnum : GradeTypeEnum.values()){
            factory.addData(TypeVO.builder().typeCode(gradeTypeEnum.getCode()).typeDescription(gradeTypeEnum.getDescription()).build());
        }

        return factory.success();
    }
}
