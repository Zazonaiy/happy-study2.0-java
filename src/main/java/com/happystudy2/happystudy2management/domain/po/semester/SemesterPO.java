package com.happystudy2.happystudy2management.domain.po.semester;

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
@Table(name = "semester")
public class SemesterPO extends BasePO {
    @Column(name = "value")
    private Integer value;

    @Column(name = "name")
    private String name;
}
