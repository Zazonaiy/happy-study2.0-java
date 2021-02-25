package com.happystudy2.happystudy2management.domain.po.course;

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
@Table(name = "course")
public class CoursePO extends BasePO {

    @Column(name = "co_no")
    private Integer coNo;

    @Column(name = "name")
    private String name;

    @Column(name = "subject_id")
    private String subjectId;

    @Column(name = "teacher_id")
    private String teacherId;

    @Column(name = "clazz_id")
    private String clazzId;


}
