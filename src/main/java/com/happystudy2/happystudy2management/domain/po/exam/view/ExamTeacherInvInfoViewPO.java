package com.happystudy2.happystudy2management.domain.po.exam.view;

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
@Table(name = "exam_teacher_inv_info_view")
public class ExamTeacherInvInfoViewPO extends BasePO {

    @Column(name = "teacher_id")
    private String teacherId;

    @Column(name = "teacher_name")
    private String teacherName;

    //exam_subject表主键
    @Column(name = "exam_subject_id")
    private String examSubjectId;

    //subject表主键
    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "exam_subject_name")
    private String examSubjectName;

    @Column(name = "exam_subject_begin_time")
    private String examSubjectBeginTime;

    @Column(name = "exam_subject_end_time")
    private String examSubjectEndTime;

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "exam_name")
    private String examName;

    @Column(name = "exam_state")
    private Integer examState;

    @Column(name = "exam_type")
    private Integer examType;

    @Column(name = "room_id")
    private String roomId;

    @Column(name = "room_max_size")
    private Integer room_max_size;

    @Column(name = "room_no")
    private Integer roomNo;

    @Column(name = "room_name")
    private String roomName;

    @Column(name = "room_place")
    private String roomPlace;

    // exam_teac_inv_room_middle表id
    @Column(name = "inv_room_middle_id")
    private String invRoomMiddleId;
}
