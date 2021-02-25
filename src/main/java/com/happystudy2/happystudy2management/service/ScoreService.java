package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.core.domain.vo.MetaData;
import com.happystudy2.happystudy2management.domain.dto.score.ScoreEditDTO;
import com.happystudy2.happystudy2management.domain.vo.ListResultVO;
import com.happystudy2.happystudy2management.domain.vo.SimpleVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreEditVO;
import com.happystudy2.happystudy2management.domain.vo.exam.score.ExamScoreVO;

import java.util.List;

public interface ScoreService {

    ExamScoreEditVO addScore(ScoreEditDTO scoreEditDTO);

    ExamScoreEditVO updateScore(ScoreEditDTO scoreEditDTO);

    List<SimpleVO> listSubjectStudentWithoutScore(String examSubjectId);

    ListResultVO listScore(MetaData metaData, String examId);
}
