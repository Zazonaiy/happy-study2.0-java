package com.happystudy2.happystudy2management.task.impl.exam;

import com.happystudy2.happystudy2management.config.SocketConfig;
import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.domain.dto.exam.ExamRemindConfigDTO;
import com.happystudy2.happystudy2management.domain.po.task.TaskPO;
import com.happystudy2.happystudy2management.factory.TaskFactory;
import com.happystudy2.happystudy2management.socket.WebSocket;
import com.happystudy2.happystudy2management.task.DynamicTask;
import com.happystudy2.happystudy2management.task.impl.BaseTaskImpl;
import org.apache.catalina.core.ApplicationContext;

import java.util.List;

public class ExamRemindTask extends BaseTaskImpl {
    //private Integer index = 0;
    //private List<Integer> doTimeBegin;
    //private List<Integer> doTimeEnd;
    //private Boolean tag = true;
    //private Boolean life = true;
    private String remindMsg = "离考试开始还有 ";

    //service
    private DynamicTask dynamicTask;
    //private WebSocket webSocket;

    /*
    public ExamRemindTask(List<Integer> doTimeBegin, List<Integer> doTimeEnd, String id){
        this.id = id;
        this.doTimeBegin = doTimeBegin;
        this.doTimeEnd = doTimeEnd;
        this.dynamicTask = (DynamicTask) TaskFactory.getBean(DynamicTask.class);
        this.webSocket = (WebSocket) TaskFactory.getBean(WebSocket.class);
    }*/
    public ExamRemindTask(String remindMsg){
        this.remindMsg = remindMsg;
        this.dynamicTask = (DynamicTask) TaskFactory.getBean(DynamicTask.class);
        //this.webSocket = (WebSocket) TaskFactory.getBean(WebSocket.class);
    }

    @Override
    public void doTask(){
        WebSocket.sendMessage(this.remindMsg);

        TaskPO taskPO = new TaskPO();
        taskPO.setId(id);
        dynamicTask.stopCron(taskPO, true);
    }
    /*
    @Override
    public void doTask() {
        if (tag){
            Integer size = doTimeBegin.size();
            if (index<size){
                String msg = this.remindMsg + String.valueOf(this.doTimeBegin.get(index));
                //TODO socket发送消息
                WebSocket.sendMessage(msg);

                if (index==size-1){
                    tag = false;
                    index=0;
                }else{
                    index++;
                }
            }
        }else{
            Integer size = doTimeEnd.size();
            if (index<size){
                String msg = this.remindMsg + String.valueOf(this.doTimeEnd.get(index));
                //TODO socket发送消息
                WebSocket.sendMessage(msg);

                if (index==size-1){
                    life = false;
                    TaskPO taskPO = new TaskPO();
                    taskPO.setId(id);
                    dynamicTask.stopCron(taskPO, true);
                }else{
                    index++;
                }
            }
        }
    }*/
}
