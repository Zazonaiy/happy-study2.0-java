package com.happystudy2.happystudy2management.core.task;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskRunnable implements Runnable{
    protected List<IBaseTask> tasks;

    @Override
    public void run(){
        for (IBaseTask task : tasks){
            task.doTask();
        }
    }
}
