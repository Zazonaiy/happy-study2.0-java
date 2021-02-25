package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.dto.ResultCop;
import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistDTO;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistMemberDTO;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRegistTaskDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import com.happystudy2.happystudy2management.domain.vo.StudentSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.TeacherSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamRoomVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSimpleVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamSubjectVO;
import com.happystudy2.happystudy2management.domain.vo.exam.ExamVO;

import java.util.List;

public interface ExamService {

    ResultCop examRegistBase(ExamRegistDTO examRegistDTO);

    ResultCop examRegistMemberConfig(ExamRegistMemberDTO examRegistMemberDTO);

    ResultCop examRegistTaskConfig(ExamRegistTaskDTO examRegistTaskDTO);

    List<ExamSimpleVO> listCreatingExamByGrade(String gradeId);

    List<ExamSubjectVO> listExamSubject(String examId);

    List<ExamRoomVO> listExamRoom(String examId);

    List<TeacherSimpleVO> listExamTeacher(String examId);

    List<StudentSimpleVO> listExamStudent(String examId);

    ListResultVO listExam(MetaData metaData);

    List<ExamVO> listExamAll(String keyword);

    List<SimpleVO> listExamClazz(String examId);

    ResultCop deleteExam(String ...ids);
}
