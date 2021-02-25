package com.happystudy2.happystudy2management.domain.po.exam;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import com.happystudy2.happystudy2management.core.domain.po.ProPO;
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
@Table(name = "pro_rent_exam_room")
public class ProRentExamRoomPO extends ProPO {

    @Column(name = "rent_remark")
    private String rentRemark;


}
