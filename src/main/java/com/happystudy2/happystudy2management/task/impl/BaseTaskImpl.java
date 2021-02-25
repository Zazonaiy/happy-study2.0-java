package com.happystudy2.happystudy2management.task.impl;

import com.happystudy2.happystudy2management.core.task.IBaseTask;
import lombok.Data;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

@Data
public abstract class BaseTaskImpl implements IBaseTask{
    protected String id;

}
