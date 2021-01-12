package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.constants.exception.MyMissingFieldException;
import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import com.happystudy2.happystudy2management.dao.*;
import com.happystudy2.happystudy2management.domain.po.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class NoGenerator {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private ClazzMapper clazzMapper;
    @Autowired
    private SubjectMapper subjectMapper;
    private final static Integer TEACHER_HEAD = 2;
    private final static Integer GRADE_HEAD = 4;
    private final static Integer CLAZZ_HEAD = 3;
    private final static Integer STUDENT_HEAD = 1;
    private final static Integer SUBJECT_HEAD = 5;
    private final static Integer COURSE_HEAD = 6;


    //年级编号 gNo = 入学年份后两位 + 初中(0)/高中(1) + 该年级序号(第几个创建的年级序号就是几,共2位，不足10的时候0占领位)；
    //年级头+入学年份后两位+初中(0)/高中(1)+序号(2位) => 共6位数
    public Integer grade(GradePO gradePO) {
        String enterYear = gradePO.getEnterStudyTime();
        Integer gradeType = gradePO.getGradeType();
        if (StringUtils.isBlank(enterYear) || gradeType==null){
            throw new MyMissingFieldException("缺少该年级入学时间或年级类型（初中/高中？）");
        }

        Example example = new Example(GradePO.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("deleted", false);

        List<GradePO> gradePOList = gradeMapper.selectByExample(example);

        String yearCode = enterYear.replace(" ", "").split("-")[0].substring(1,3);
        String gradeTypeCode = String.valueOf(gradeType);
        //String countCode = gradeWillCount<10 ? "0"+String.valueOf(gradeWillCount) : String.valueOf(gradeWillCount);
        String countCode = getCountCode(gradePOList, 2);

        Integer no = Integer.parseInt(GRADE_HEAD + yearCode + gradeTypeCode + countCode);
        return no;
    }

    //教师编号 teacherHead + 教师序列数(共4位，不足的0占位)
    public Integer teacherNo(TeacherPO teacherPO){
        Integer count = teacherMapper.selectCountByExample(new Example(TeacherPO.class));
        String countStr = String.valueOf(count);
        String addToHead = "";
        Integer len = countStr.length();
        for (int i = 0; i < 4-len; i++){
            addToHead += "0";
        }
        countStr = addToHead+countStr;
        return Integer.parseInt(TEACHER_HEAD+countStr);
    }

    //班级编号 clNo = 年级编号 + 班级序号（共2位，不足10的时候0占位）
    // 班级头 + 年级后两位 + 班级序号（2位） => 共5位
    public Integer clazzNo(GradePO gradePO){
        String gNoStr = String.valueOf(gradePO.getGNo());
        String gId = gradePO.getId();
        if (StringUtils.isBlank(gNoStr) || StringUtils.isBlank(gId)){
            throw new MyMissingFieldException("缺少该班级所属年级的 年级号、年级Id");
        }
        if (gNoStr.length() < 2){
            throw new MyMissingFieldException("该班级所处的年级号长度小于4位，请检查数据是否位脏数据");
        }
        gNoStr = gNoStr.substring(gNoStr.length()-2, gNoStr.length()); //学号后两位



        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gId);
        List<ClazzPO> clazzPOList = clazzMapper.selectByExample(example);

        String countCode = getCountCode(clazzPOList, 2);

        return Integer.parseInt(CLAZZ_HEAD + gNoStr + countCode);

    }

    //学号编号 sNo = 班级号 + 学生序号（共2位， 不足10和10的时候0占位） 测试成功！！
    // 学生头 + 班级号后4位 + 学生序号(共2位) => 共 7 位
    public Integer studentNo(ClazzPO clazzPO){
        String clId = clazzPO.getId();
        String clNoStr = String.valueOf(clazzPO.getClNo());
        if (StringUtils.isBlank(clNoStr) || StringUtils.isBlank(clId)){
            throw new MyMissingFieldException("缺少该学生所属班级的 班级号、班级Id");
        }
        if (clNoStr.length() < 4){
            throw new MyMissingFieldException("该学生所处的班级号长度小于4位，请检查数据是否位脏数据");
        }
        clNoStr.substring(clNoStr.length()-4, clNoStr.length());

        Example example = new Example(StudentPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("clazzId", clId);
        List<StudentPO> studentPOList = studentMapper.selectByExample(example);

        String countCode = getCountCode(studentPOList, 2);

        return Integer.parseInt(STUDENT_HEAD + clNoStr + countCode);
    }

    //TODO: 科目编号 subNo = 科目头 + 科目序号（共3位，不足100和10的时候0占位）
    public Integer subjectNo(SubjectPO subjectPO){
        Example example = new Example(SubjectPO.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("deleted", false);
        Integer countCode = subjectMapper.selectCountByExample(example);

        return Integer.parseInt(SUBJECT_HEAD + getCountCode(countCode, 3));
    }

    //TODO: 课程号 coNo = 课程头 + 科目后3位 + 班级后2位
    public Integer courseNo(SubjectPO subjectPO, ClazzPO clazzPO){
        String subCode = String.valueOf(subjectPO.getSubNo());
        String clazzCode = String.valueOf(clazzPO.getClNo());

        subCode = subCode.substring(subCode.length()-3, subCode.length());
        clazzCode = clazzCode.substring(clazzCode.length()-2, clazzCode.length());
        return Integer.parseInt(COURSE_HEAD + subCode + clazzCode);
    }

    /**
     * 获取序号
     * @param queryResult
     * @param digit 序号位数（1占1位 2占2位 3占3位）
     * @return
     */
    private String getCountCode(List<? extends BasePO> queryResult, Integer digit){
        Integer index = queryResult.size()+1;
        StringBuffer stringBuffer = new StringBuffer(String.valueOf(index));
        StringBuffer digitBuffer = new StringBuffer(String.valueOf(digit));
        Integer digitMinNum = 0;
        if (digit > 1){
            for (int j = 1; j < digit; j++){
                digitBuffer.append("0");
            }
            digitMinNum = Integer.valueOf(digitBuffer.toString()); //1-0 2-10 3-100
        }

        for (int i = 1; i < digit; i++){
            stringBuffer.insert(0, "0");
        }
        return index<digitMinNum ? stringBuffer.toString() : String.valueOf(index); //占位或不占为
    }
    private String getCountCode(Integer totalCount, Integer digit){
        Integer index = totalCount+1;
        StringBuffer stringBuffer = new StringBuffer(String.valueOf(index));
        StringBuffer digitBuffer = new StringBuffer(String.valueOf(digit));
        Integer digitMinNum = 0;
        if (digit > 1){
            for (int j = 1; j < digit; j++){
                digitBuffer.append("0");
            }
            digitMinNum = Integer.valueOf(digitBuffer.toString()); //1-0 2-10 3-100
        }

        for (int i = 1; i < digit; i++){
            stringBuffer.insert(0, "0");
        }
        return index<digitMinNum ? stringBuffer.toString() : String.valueOf(index); //占位或不占为
    }
}
