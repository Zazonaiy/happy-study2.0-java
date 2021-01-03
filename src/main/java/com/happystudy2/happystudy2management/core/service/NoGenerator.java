package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.constants.exception.MyMissingFieldException;
import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import com.happystudy2.happystudy2management.dao.ClazzMapper;
import com.happystudy2.happystudy2management.dao.GradeMapper;
import com.happystudy2.happystudy2management.dao.StudentMapper;
import com.happystudy2.happystudy2management.dao.TeacherMapper;
import com.happystudy2.happystudy2management.domain.po.ClazzPO;
import com.happystudy2.happystudy2management.domain.po.GradePO;
import com.happystudy2.happystudy2management.domain.po.StudentPO;
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

    //年级编号 gNo = 入学年份后两位 + 初中(00)/高中(11) + 该年级序号(第几个创建的年级序号就是几,共2位，不足10的时候0占领位)；
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
        String gradeTypeCode = String.valueOf(gradeType) + String.valueOf(gradeType);
        //String countCode = gradeWillCount<10 ? "0"+String.valueOf(gradeWillCount) : String.valueOf(gradeWillCount);
        String countCode = getCountCode(gradePOList, 2);

        Integer no = Integer.parseInt(yearCode + gradeTypeCode + countCode);
        return no;
    }

    //班级编号 clNo = 年级编号 + 班级序号（共2位，不足10的时候0占位）
    public Integer clazzNo(GradePO gradePO){
        Integer gNo = gradePO.getGNo();
        String gId = gradePO.getId();
        if (gNo == null || StringUtils.isBlank(gId)){
            throw new MyMissingFieldException("缺少该班级所属年级的 年级号、年级Id");
        }


        Example example = new Example(ClazzPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("gradeId", gId);
        List<ClazzPO> clazzPOList = clazzMapper.selectByExample(example);

        String countCode = getCountCode(clazzPOList, 2);

        return Integer.parseInt(String.valueOf(gNo) + countCode);

    }

    //学号编号 sNo = 班级号 + 学生序号（共3位， 不足100和10的时候0占位） 测试成功！！
    public Integer studentNo(ClazzPO clazzPO){
        String clId = clazzPO.getId();
        Integer clNo = clazzPO.getClNo();
        if (clNo == null || StringUtils.isBlank(clId)){
            throw new MyMissingFieldException("缺少该学生所属班级的 班级号、班级Id");
        }

        Example example = new Example(StudentPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("clazzId", clId);
        List<StudentPO> studentPOList = studentMapper.selectByExample(example);

        String countCode = getCountCode(studentPOList, 3);

        return Integer.parseInt(String.valueOf(clNo) + countCode);
    }

    //TODO: 科目编号 subNo = 开设年份后两位 + 科目序号（共3位，不足100和10的时候0占位）

    //TODO: 课程号 coNo = 科目类型编号 + 班级号

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

        for (int i = 1; i <= digit; i++){
            stringBuffer.insert(0, "0");
        }
        return index<digitMinNum ? stringBuffer.toString() : String.valueOf(index); //占位或不占为
    }
}
