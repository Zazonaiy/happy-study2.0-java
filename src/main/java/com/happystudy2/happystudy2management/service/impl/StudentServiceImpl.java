package com.happystudy2.happystudy2management.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.MemberTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.SexEnum;
import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.core.service.NoGenerator;
import com.happystudy2.happystudy2management.dao.clazz.ClazzMapper;
import com.happystudy2.happystudy2management.dao.student.StudentInfoViewMapper;
import com.happystudy2.happystudy2management.dao.student.StudentMapper;
import com.happystudy2.happystudy2management.domain.dto.StudentEditDTO;
import com.happystudy2.happystudy2management.domain.dto.StudentImportDTO;
import com.happystudy2.happystudy2management.domain.po.clazz.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.student.StudentPO;
import com.happystudy2.happystudy2management.domain.po.student.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.StudentVO;
import com.happystudy2.happystudy2management.service.StudentService;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.util.TimeUtil;
import org.apache.commons.compress.utils.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Objects;

/**
 *
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private StudentInfoViewMapper studentInfoViewMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private NoGenerator noGenerator;

    @Override
    public ListResultVO listStudent(MetaData metaData) {
        //Condition condition = new Condition(StudentInfoViewPO.class);
        Example example = new Example(StudentInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        if (Objects.nonNull(metaData)&&Objects.nonNull(metaData.getFilter())){
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeType"))){
                criteria.andEqualTo("gradeType", metaData.getFilter().get("gradeType"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("gradeId"))){
                criteria.andEqualTo("gradeId", metaData.getFilter().get("gradeId"));
            }
            if (StringUtils.isNotBlank(metaData.getFilter().get("sex"))){
                criteria.andEqualTo("sex", Integer.parseInt(metaData.getFilter().get("sex")));
            }
        }

        if (Objects.nonNull(metaData) && (!metaData.getExt().isEmpty())){
            List<String> ext = metaData.getExt();
            String e = "%"+ext.get(0)+"%";
            if (!e.equals("")){
                criteria.andLike("name", e);
                criteria.orLike("sNo", e);
            }

        }

        String orderBy = metaData.getPaginationParam().getOrderBy();
        String orderWay = metaData.getPaginationParam().getOrderWay();

        if (Objects.isNull(orderBy)){
            orderBy = "";
        }
        if (Objects.nonNull(orderWay) && StringUtils.isNotBlank(orderBy)){
            if (orderWay.equalsIgnoreCase("desc")){
                example.orderBy(orderBy).desc();
                //orderBy += " desc";
            }else {
                example.orderBy(orderBy).asc();
                //orderBy += " asc";
            }
        }

        //PageHelper.startPage(1, 10, "aaa, asc");
        PageHelper.startPage(metaData.getPaginationParam().getPage(), metaData.getPaginationParam().getPageSize());
        PageInfo<StudentInfoViewPO> pageInfo = new PageInfo<>(studentInfoViewMapper.selectByExample(example));

        List<StudentInfoViewPO> studentInfoViewPOList = pageInfo.getList();

        //List<StudentInfoViewPO> studentInfoViewPOList = studentInfoViewMapper.selectAll();
        List<StudentVO> result = Lists.newArrayList();
        for (StudentInfoViewPO studentInfoViewPO : studentInfoViewPOList){
            StudentVO studentVO = typeMapper.map(studentInfoViewPO, StudentVO.class);
            studentVO.setSex(SexEnum.sexOf(studentInfoViewPO.getSex()));
            studentVO.setAge(TimeUtil.mapAge(studentInfoViewPO.getBirthday()));
            result.add(studentVO);
        }

        //Long count = pageInfo.getTotal();             //数据总数
        //Integer a = pageInfo.getNavigateLastPage();   //最后一页页码
        //Integer b = pageInfo.getEndRow();             //最后一行所在的行数
        //Integer c = pageInfo.getPages();              //共多少页
        metaData.getPaginationParam().setTotalCount(pageInfo.getTotal());
        metaData.getPaginationParam().setPageCount(pageInfo.getPages());

        ListResultVO resultVO = ListResultVO.builder().resList(result).paginationParam(metaData.getPaginationParam()).build();

        return resultVO;
    }

    @Override
    public List<StudentVO> pageHelperTest(){
        Example example = new Example(StudentInfoViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        PageHelper.startPage(1, 5, "asc");
        PageInfo<StudentInfoViewPO> pageInfo = new PageInfo<>(studentInfoViewMapper.selectByExample(example));
        List<StudentInfoViewPO> studentInfoViewPOList = pageInfo.getList();

        List<StudentVO> result = Lists.newArrayList();
        for (StudentInfoViewPO studentInfoViewPO : studentInfoViewPOList){
            StudentVO studentVO = typeMapper.map(studentInfoViewPO, StudentVO.class);
            studentVO.setSex(SexEnum.sexOf(studentInfoViewPO.getSex()));
            studentVO.setAge(TimeUtil.mapAge(studentInfoViewPO.getBirthday()));
            result.add(studentVO);
        }
        return result;
    }

    @Override
    public StudentVO addStudent(StudentEditDTO studentEditDTO){
        StudentPO studentPO = typeMapper.map(studentEditDTO, StudentPO.class);
        String clazzId = studentEditDTO.getClazzId();
        ClazzPO clazzPO = clazzMapper.selectByPrimaryKey(clazzId);

        //生成学号并插入
        Integer sNo = noGenerator.studentNo(clazzPO);
        studentPO.setSNo(sNo);

        //补全班主任字段
        String clazzMasterId = clazzPO.getClazzMasterId();
        studentPO.setClazzMasterId(clazzMasterId);

        //插入学生标签
        studentPO.setMemberType(MemberTypeEnum.STUDENT.getCode());

        studentMapper.insertSelective(studentPO);
        return typeMapper.map(studentPO, StudentVO.class);
    }

    @Transactional
    @Override
    public String addStudentBatch(List<StudentImportDTO> studentImportDTOListist){
        StringBuffer msgBuffer = new StringBuffer();
        msgBuffer.append("success ");
        int index=0;
        try{
            for (StudentImportDTO studentImportDTO : studentImportDTOListist){
                String clazzId = this.getClazzIdByStudentImportDTO(studentImportDTO);
                StudentEditDTO stuAddDTO = typeMapper.map(studentImportDTO, StudentEditDTO.class);
                stuAddDTO.setClazzId(clazzId);

                this.addStudent(stuAddDTO);
                msgBuffer.append("[row "+ ++index + " success] ");
            }
        }catch (Exception e){
            e.printStackTrace();
            msgBuffer.append("[row " + ++index + " error] ");
        }

        return msgBuffer.toString();

    }
    private String getClazzIdByStudentImportDTO(StudentImportDTO studentImportDTO){
        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("clNo", studentImportDTO.getClazzNo());
        ClazzPO clazzPO = clazzMapper.selectOneByExample(example);
        return clazzPO.getId();
    }

    @Override
    public StudentVO updateStudent(StudentEditDTO studentEditDTO) {
        StudentPO studentPO = typeMapper.map(studentEditDTO, StudentPO.class);
        StudentPO exist = studentMapper.selectByPrimaryKey(studentPO);

        String clazzId = studentEditDTO.getClazzId();
        ClazzPO clazzPO = clazzMapper.selectByPrimaryKey(clazzId);

        //修改了班级，班主任id也会变
        String clazzMasterId = clazzPO.getClazzMasterId();

        studentPO.setClazzMasterId(clazzMasterId);
        studentPO.setLastModifyTime(exist.getLastModifyTime());

        studentMapper.updateByPrimaryKeySelective(studentPO);
        return typeMapper.map(exist, StudentVO.class);
    }

    @Transactional
    @Override
    public ResultCop deleteStudent(String... ids) {
        ResultCop res = new ResultCop();
        StringBuffer description = new StringBuffer();
        StudentPO stuExample = new StudentPO();
        Boolean warnTag = false;
        Integer notExistCount = 0;
        Integer successCount = 0;
        Integer index = 0;

        try{
            for (String id : ids){
                stuExample.setId(id);
                StudentPO exist = studentMapper.selectByPrimaryKey(stuExample);
                if (exist==null){
                    warnTag = true;
                    notExistCount++;
                    continue;
                }

                exist.setDeleted(true);
                studentMapper.updateByPrimaryKey(exist);
                successCount++;
                index++;
            }
        } catch (Exception e){
            e.printStackTrace();
            res.setIsSuccess(ResultCop.FAILED);
            res.setDescription("error index: -" + index);
            res.setWarnTag(ResultCop.NOT_WARN);
            return res;
        }

        res.setIsSuccess(ResultCop.SUCCESS);
        res.setDescription("/r/n success: "+successCount+", /r/n invalid: "+notExistCount);
        res.setWarnTag(warnTag);
        return res;
    }

    @Override
    public StudentPO queryByNo(Integer sNo){
        if (Objects.isNull(sNo)){
            return null;
        }

        Example example = new Example(StudentPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("sNo", sNo);

        return studentMapper.selectOneByExample(example);
    }
}
