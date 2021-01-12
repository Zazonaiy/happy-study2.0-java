package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.CourseEditDTO;
import com.happystudy2.happystudy2management.domain.vo.CourseVO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;

import java.util.List;

public interface CourseService {

    List<TeacherSimpleVO> listCourseAbleTeacher();

    ListResultVO listCourse(MetaData metaData);

    CourseVO addCourse(CourseEditDTO courseEditDTO);

    CourseVO updateCourse(CourseEditDTO courseEditDTO);

    ResultCop deleteCourse(String ...ids);
}
