package com.happystudy2.happystudy2management.domain.po.exam;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "exam_subject_student")
public class ExamSubjectStudentPO extends BasePO {

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "student_id")
    private String studentId;

    @Column(name = "exam_subject_id")
    private String examSubjectId;

    @Column(name = "exam_room_id")
    private String examRoomId;

}
