package com.happystudy2.happystudy2management.constants.constants.bussiness;

public class UrlMap {
    public static final String WELCOME_CONTROLLER = "/happy-study";

    public static final String STUDENT_CONTROLLER = "/happy-study/studentMan";
    public static final String SM_BASE_INFO = "";
    public static final String SM_SCORE = "/score";
    public static final String SM_PU = "/pu";
    public static final String SM_RE = "/re";
    public static final String SM_COMP = "/comp";

    public static final String TEACHER_CONTROLLER = "/happy-study/teacherMan";
    public static final String TM_BASE_INFO = "";
    public static final String TM_COURSE = "/course";
    public static final String TM_CLAZZ = "/clazz";
    public static final String TM_PU = "/pu";
    public static final String TM_RE = "/re";
    public static final String TM_COMP = "/comp";

    public static final String CLAZZ_CONTROLLER = "/happy-study/clazzMan";
    public static final String CLM_BASE_INFO = "";
    public static final String CLM_PU = "/pu";
    public static final String CLM_RE = "/re";
    public static final String CLM_SCORE = "/score";

    public static final String GRADE_CONTROLLER = "/happy-study/gradeMan";
    public static final String GM_BASE_INFO = "";
    public static final String GM_MASTER = "/master";
    public static final String GM_TEACHER = "/teacher";
    public static final String GM_SCORE = "/score";
    public static final String GM_COMP = "/comp";

    public static final String COURSE_CONTROLLER = "/happy-study/courseMan";
    public static final String COM_BASE_INFO = "";
    public static final String COM_TEACHER = "/teacher";
    public static final String COM_SCORE = "/score";
    public static final String COM_HOMEWORK = "/homework";

    public static final String SCORE_CONTROLLER = "/happy-study/scoreMan";
    public static final String SCM_BASE_INFO = "";
    public static final String SCM_IMPORT = "/import";
    public static final String SCM_UPDATE = "/update";

    public static final String SUBJECT_CONTROLLER = "/happy-study/subjectMan";
    public static final String SBM_BASE_INFO = "";
    public static final String SBM_SCORE = "/score";

    public static final String USER_CONTROLLER = "/happy-study/userMan";
    public static final String UM_BASE_INFO = "";//用户列表
    public static final String UM_REGIST = "/regist";
    public static final String UM_UPDATE = "/update";
    public static final String UM_MY = "/my";
    public static final String UM_COURSE_TABLE = "/courseTable";

    public static final String EXAM_CONTROLLER = "/happy-study/exam";
    public static final String EXM_BASE_INFO = "";
    public static final String EXM_REGIST = "/regist"; //开设考试
    public static final String EXM_ONGOING = "/ongoing"; //正在进行的考试

    public static final String REPU_CONTROLLER = "/happy-study/repu";
    public static final String RPM_PU_APPLY = "/puApply";
    public static final String RPM_PU_APPROVAL = "/puApproval";
    public static final String RPM_RE_APPLE = "/reApple";
    public static final String RPM_RE_APPROVAL = "/reApproval";

    public static final String ASSESS_CONTROLLER = "/happy-study/assess";
    public static final String ASM_QUERY = ""; //考核查询
    public static final String ASM_EVA_STUDENT = "/student"; //学生评分
    public static final String ASM_EVA_TEACHER = "/teacher"; //教师评分
    public static final String ASM_EVA_CLAZZ = "/clazz"; //班级评分
    public static final String ASM_EVA_GRADE = "/grade"; //年级评分
    public static final String ASM_EVA_COURSE = "/course"; //课程评分

    public static final String LEAVE_CONTROLLER = "/happy-study/leave";

    public static final String HEALTH_CONTROLLER = "/happy-study/health";
    public static final String HLM_DALIY = "/daliy";
    public static final String HLM_BASE_INFO = ""; //校园健康状况一览，风险查询
    public static final String HLM_SOLVED = "/solved";
    public static final String HLM_APPLY = "/apply";
    public static final String HLM_APPROVAL = "/approval";


    /**
     * 菜单之外的controller
     */
    public static final String SEMESTER_CONTROLLER = "/happy-study/semesterMan";
}
