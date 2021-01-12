package com.happystudy2.happystudy2management.domain.po;

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
@Table(name = "task")
public class TaskPO extends BasePO {

    @Column(name = "cron")
    private String cron;

    @Column(name = "task_no")
    private Integer taskNo;

    @Column(name = "name")
    private String name;
}
