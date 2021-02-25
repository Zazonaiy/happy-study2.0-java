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
@Table(name = "exam_room_info_view")
public class ExamRoomInfoViewPO extends BasePO {

    @Column(name = "exam_id")
    private String examId;

    @Column(name = "room_no")
    private Integer roomNo;

    @Column(name = "room_place")
    private String roomPlace;

    @Column(name = "room_name")
    private String roomName;

    @Column(name = "different_place_tag")
    private Boolean differentPlaceTag;

    @Column(name = "rent_tag")
    private Boolean rentTag;

    @Column(name = "rent_grade_id")
    private String rentGradeId;

    @Column(name = "rent_grade_name")
    private String rentGradeName;

    @Column(name = "rent_state")
    private Integer rentState;

    @Column(name = "max_size")
    private Integer maxSize;

}
