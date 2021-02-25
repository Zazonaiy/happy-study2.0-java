package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.MemberTypeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.LoginParam;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.core.service.UserHelper;
import com.happystudy2.happystudy2management.domain.dto.login.LoginDTO;
import com.happystudy2.happystudy2management.domain.dto.user.UserEditDTO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.domain.vo.login.LoginVO;
import com.happystudy2.happystudy2management.domain.vo.user.UserEditVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.loginCenter.Authenticator;
import com.happystudy2.happystudy2management.service.UserService;
import com.happystudy2.happystudy2management.util.ObjReflectUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequestMapping(UrlMap.USER_CONTROLLER)
public class UserController {
    //public static final Map<String, Subject> userMap = new ConcurrentHashMap<>();
    //public static final String CURRENT_USER_KEY = "currentUser";

    @Autowired
    private UserService userService;
    @Autowired
    private Authenticator authenticator;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private UserHelper userHelper;

    //@RequestMapping("/login")
    //public String index(){
    //    return "login/login";
    //}
    //@RequestMapping("/login/regist")
    //public String toRegist(HttpServletRequest request){
    //    return "login/regist";
    //}
    //@RequestMapping("/login/updater")
    //public String toUpdater(HttpServletRequest request){
    //    return "login/updater";
    //}
    @RequestMapping(UrlMap.UM_BASE_INFO)
    public String toUser(HttpServletRequest request){
        return "user/user_man.html";
    }
    @RequestMapping(UrlMap.UM_REGIST)
    public String createUser(HttpServletRequest request){
        request.setAttribute("action", "add");
        request.setAttribute("title", "创建账号");
        return "user/form/add";
    }
    @RequestMapping(UrlMap.UM_UPDATE)
    public String updateUser(HttpServletRequest request){
        request.setAttribute("action", "update");
        request.setAttribute("title", "修改密码");
        return "user/form/add";
    }
    @RequestMapping(UrlMap.UM_MY)
    public String myInfo(HttpServletRequest request){
        return "user/myInfo";
    }


    @GetMapping("/list/memberType")
    @ResponseBody
    public ResultData<TypeVO> getMemberTypeList(){
        ResultDataFactory factory = new ResultDataFactory();
        for (MemberTypeEnum e : MemberTypeEnum.values()){
            factory.addData(TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build());
        }

        return factory.success();
    }

    @PostMapping("/doEdit/add")
    @ResponseBody
    public ResultData<UserEditVO> addUser(@RequestBody UserEditDTO userEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (StringUtils.isBlank(userEditDTO.getUsername())){
                return factory.error("注册失败: 缺少参数");
            }
            if (StringUtils.isBlank(userEditDTO.getPassword())){
                return factory.error("注册失败: 缺少参数");
            }
            if (Objects.isNull(userEditDTO.getMemberType())){
                return factory.error("注册失败: 缺少参数");
            }
            if (Objects.isNull(userEditDTO.getMemberNo())){
                if (!MemberTypeEnum.ADMIN.getCode().equals(userEditDTO.getMemberType())){
                    return factory.error("注册失败: 缺少参数");
                }

            }

            UserEditVO userEditVO = userService.addUser(userEditDTO);
            return factory.success("注册成功! " +userEditVO.getUsername());
        } catch (BussinessExcecption e){
            e.printStackTrace();
            return factory.error("注册失败: " + e.getErrorCode());
        }
    }

    @PostMapping("/doEdit/update")
    @ResponseBody
    public ResultData<UserEditVO> updateUser(@RequestBody UserEditDTO userEditDTO){
        ResultDataFactory factory = new ResultDataFactory();

        try{
            if (StringUtils.isBlank(userEditDTO.getUsername())){
                return factory.error("修改失败: 缺少参数");
            }
            if (StringUtils.isBlank(userEditDTO.getPassword())){
                return factory.error("修改失败: 缺少参数");
            }
            if (StringUtils.isBlank(userEditDTO.getNewPassword())){
                return factory.error("修改失败: 缺少参数");
            }

            UserEditVO userEditVO = userService.updatePassword(userEditDTO);
            return factory.success("修改成功! " +userEditVO.getUsername());
        } catch (BussinessExcecption e){
            e.printStackTrace();
            return factory.error("修改失败: " + e.getErrorCode());
        }
    }

    @GetMapping("/query/member/isExist")
    @ResponseBody
    public ResultData<BaseVO> isMemberExist(Integer memberNo, Integer memberType){
        ResultDataFactory resultDataFactory = new ResultDataFactory();
        if (Objects.isNull(memberNo)||Objects.isNull(memberType)){
            return resultDataFactory.error();
        }
        if (MemberTypeEnum.ADMIN.getCode().equals(memberType)){
            return resultDataFactory.success();
        }
        Boolean res = userService.isMemberExist(memberNo, memberType);
        if (res){
            return resultDataFactory.success();
        }else{
            return resultDataFactory.error();
        }
    }

    @GetMapping("/query/username/isExist")
    @ResponseBody
    public ResultData<BaseVO> isUsernameExist(String username){
        ResultDataFactory resultDataFactory = new ResultDataFactory();
        if (StringUtils.isBlank(username)){
            return resultDataFactory.error();
        }
        Boolean res = userService.isUsernameExist(username);
        if (res){
            return resultDataFactory.success();
        }else{
            return resultDataFactory.error();
        }
    }
}
