package com.happystudy2.happystudy2management.constants.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MyMissingFieldException extends RuntimeException {
    protected String description;

    public MyMissingFieldException(String description){
        this.description = description;
    }
}
