package com.happystudy2.happystudy2management.factory;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.MemberTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ProOpinionEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ProStateEnum;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ResponsibilityTeacherEnum;
import com.happystudy2.happystudy2management.core.domain.dto.LifeCycle;
import com.happystudy2.happystudy2management.core.domain.po.ProPO;
import com.happystudy2.happystudy2management.dao.student.StudentInfoViewMapper;
import com.happystudy2.happystudy2management.dao.teacher.TeacherInfoViewMapper;
import com.happystudy2.happystudy2management.domain.po.student.view.StudentInfoViewPO;
import com.happystudy2.happystudy2management.domain.po.teacher.view.TeacherInfoViewPO;
import com.happystudy2.happystudy2management.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Objects;

@Service
public class ProFactory {
    private static final Integer[] BIG_MONTH = {1,3,5,7,8,10,12};
    private static final Integer[] SMALL_MONTH = {4,6,9,11};
    private static final Integer SPECIAL_MONTH = 2;
    private static final Integer BIG_MONTH_DAY_COUNT = 31;
    private static final Integer SMALL_MONTH_DAY_COUNT = 30;
    private static final Integer SPECIAL_MONTH_DAY_COUNT = 28;
    private static final Integer YEAR_MONTH_COUNT = 12;
    private static final Integer[] SIZE_TABLE = {9, 99, 999, 9999};

    @Autowired
    private StudentInfoViewMapper studentInfoViewMapper;
    @Autowired
    private TeacherInfoViewMapper teacherInfoViewMapper;

    public ProPO registPro(LifeCycle lifeCycle){
        String launchDate = this.formatLaunchDate();
        String deadDate = this.formateDeadDate(launchDate, lifeCycle);
        return ProPO.builder().launchDate(launchDate).deadDate(deadDate).opinion(ProOpinionEnum.WAIT.getCode())
                .proState(ProStateEnum.WAIT.getCode()).build();
    }

    /**
     *
     * @param lifeCycle 该流程的申请生命周期
     * @param applicant 申请人
     * @param approvalBy 审批人
     * @return
     */
    public ProPO registPro(LifeCycle lifeCycle, String applicant, String approvalBy){
        String launchDate = this.formatLaunchDate();
        String deadDate = this.formateDeadDate(launchDate, lifeCycle);
        ResponsibilityTeacherEnum aple = this.getMemberType(applicant);
        ResponsibilityTeacherEnum apre = this.getMemberType(approvalBy);
        Integer aplType = null;
        Integer aprType = null;
        if (Objects.nonNull(aple)){
            aplType = aple.getCode();
        }
        if (Objects.nonNull(apre)){
            aprType = apre.getCode();
        }

        return ProPO.builder().launchDate(launchDate).deadDate(deadDate).proState(ProStateEnum.WAIT.getCode())
                .opinion(ProOpinionEnum.WAIT.getCode()).applicantId(applicant).applicantType(aplType)
                .approvalById(approvalBy).approvalByType(aprType).build();

    }

    public LifeCycle getLifeCycle(Integer day){
        return LifeCycle.builder().day(day).build();
    }

    private ResponsibilityTeacherEnum getMemberType(String id){
        StudentInfoViewPO studentInfoViewPO = studentInfoViewMapper.selectByPrimaryKey(id);
        if (Objects.nonNull(studentInfoViewPO)){
            return ResponsibilityTeacherEnum.STUDENT;
        }
        TeacherInfoViewPO teacherInfoViewPO = teacherInfoViewMapper.selectByPrimaryKey(id);
        if (Objects.nonNull(teacherInfoViewPO)){
            return ResponsibilityTeacherEnum.codeOf(teacherInfoViewPO.getRespType());
        }

        return null;
    }

    private String formatLaunchDate(){
        return TimeUtil.TIME_FORMAT.format(new Date());
    }
    private String formateDeadDate(String formatedDate, LifeCycle lifeCycle){
        String[] dateStrs = formatedDate.split(" ")[0].split("-");
        String[] timeStrs = formatedDate.split(" ")[1].split(":");
        //TODO: 根据年、月、时、分、秒 偏移量 来算deadTime
        if (Objects.nonNull(lifeCycle.getDay())){
            Integer day = Integer.parseInt(dateStrs[2]);
            Integer month = Integer.parseInt(dateStrs[1]);
            Integer year = Integer.parseInt(dateStrs[0]);
            day += lifeCycle.getDay();
            Integer monthDayCount = this.getMonthDayCount(month);

            if (Objects.isNull(monthDayCount)){
                //TODO: throw exception
            }
            Integer[] ms = this.IterateMonth(day, month, monthDayCount);
            month = ms[0];
            day = ms[1];
            Integer[] ys = this.IterateYear(month, year);
            year = ys[0];
            month = ys[1];

            String deadDate = toDateStr(year, month, day);
            return deadDate;
        }

        return null;
    }


    public String toDateStr(Integer year, Integer month, Integer day){
        StringBuffer sb = new StringBuffer();
        sb.append(year+"-");

        if (this.getIntSize(month)==1){
            sb.append("0"+month+"-");
        }else{
            sb.append(String.valueOf(month)+"-");
        }

        if (this.getIntSize(day)==1){
            sb.append("0"+day);
        }else{
            sb.append(String.valueOf(day));
        }

        return sb.toString();
    }
    private Integer getIntSize(Integer i){
        for (int j = 0;;j++){
            if (i<=SIZE_TABLE[j]){
                return j+1;
            }
        }
    }

    private Integer[] IterateYear(Integer month, Integer year){
        if (month > YEAR_MONTH_COUNT){
            month = month - YEAR_MONTH_COUNT;
            year++;
            IterateYear(month, year);
        }
        return new Integer[]{year, month};
    }
    private Integer[] IterateMonth(Integer day, Integer month, Integer monthDayCount){
        if (day > monthDayCount){
            day = day - monthDayCount;
            month++;
            IterateMonth(day, month, monthDayCount);
        }

        return new Integer[]{month, day};
    }
    private Integer getMonthDayCount(Integer month){
        if (month==SPECIAL_MONTH){
            return SMALL_MONTH_DAY_COUNT;
        }
        for (int m : BIG_MONTH){
            if (month==m){
                return BIG_MONTH_DAY_COUNT;
            }
        }
        for (int m : SMALL_MONTH){
            if (month==m){
                return SMALL_MONTH_DAY_COUNT;
            }
        }
        return null;
    }

}
