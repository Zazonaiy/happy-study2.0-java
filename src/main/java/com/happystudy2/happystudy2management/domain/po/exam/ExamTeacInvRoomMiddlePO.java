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
@Table(name = "exam_teac_inv_room_middle")
public class ExamTeacInvRoomMiddlePO extends BasePO {

    @Column(name = "teacher_inv_id")
    private String teacherInvId;

    @Column(name = "exam_room_id")
    private String examRoomId;
}
