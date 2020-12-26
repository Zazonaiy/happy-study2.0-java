package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoGenerator {
    @Autowired
    private StudentMapper studentMapper;

    //年级编号 gNo = 入学年份后两位 + 初中(00)/高中(11) + 该年级序号(第几个创建的年级序号就是几,共2位，不足10的时候0占领位)；

    //班级编号 clNo = 年级id + 班级序号（共2位，不足10的时候0占位）

    //学号编号 sNo = 班级号 + 学生序号（共3位， 不足100和10的时候0占位）

    //科目编号 subNo = 开设年份后两位 + 科目序号（共3位，不足100和10的时候0占位）

    //课程号 coNo = 科目类型编号 + 班级号
}
