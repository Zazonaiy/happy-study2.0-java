package com.happystudy2.happystudy2management.core.domain.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LifeCycle {

    private Integer second;

    private Integer min;

    private Integer hour;

    private Integer day;

    private Integer month;

    private Integer year;
}
