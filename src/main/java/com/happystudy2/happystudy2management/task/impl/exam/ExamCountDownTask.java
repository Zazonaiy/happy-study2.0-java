package com.happystudy2.happystudy2management.task.impl.exam;

import com.happystudy2.happystudy2management.core.task.IBaseTask;
import com.happystudy2.happystudy2management.domain.po.exam.ExamPO;
import com.happystudy2.happystudy2management.domain.po.task.TaskPO;
import com.happystudy2.happystudy2management.factory.TaskFactory;
import com.happystudy2.happystudy2management.socket.WebSocket;
import com.happystudy2.happystudy2management.task.DynamicTask;
import com.happystudy2.happystudy2management.task.impl.BaseTaskImpl;

public class ExamCountDownTask extends BaseTaskImpl {
    private String beginDate;
    private DynamicTask dynamicTask;
    private Boolean isOnce = false;
    private Boolean overTime = false;
    private String examName = "";

    public ExamCountDownTask(String beginDate, String examName){
        this.beginDate = beginDate;
        this.examName = examName;
        this.dynamicTask = (DynamicTask) TaskFactory.getBean(DynamicTask.class);
    }
    public ExamCountDownTask(String beginDate, String examName, Boolean isOnce){
        this.beginDate = beginDate;
        this.isOnce = isOnce;
        this.examName = examName;
        this.dynamicTask = (DynamicTask) TaskFactory.getBean(DynamicTask.class);
    }
    @Override
    public void doTask() {
        String remindMsg = "离"+this.examName+"还有"+this.getCountDownDay()+"天";
        if (this.overTime){
            //销毁
            this.drop();
            return ;
        }

        WebSocket.sendMessage(remindMsg);

        if (isOnce){
            //销毁
            this.drop();
        }else{
            if (this.judgOverTime()){
                overTime = true;
            }
        }

    }
    private Integer getCountDownDay(){
        String[] dates = this.beginDate.split("-");
        //TODO: 计算离考试还有多少天

        return 1;
    }

    //销毁
    private boolean drop(){
        TaskPO taskPO = new TaskPO();
        taskPO.setId(this.id);
        dynamicTask.stopCron(taskPO, true);
        return true;
    }
    private boolean judgOverTime(){
        //TODO: 判断是否超过了开考时间，是则true, 不是则false
        return false;
    }
}
