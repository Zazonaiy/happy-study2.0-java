package com.happystudy2.happystudy2management.controller;

import com.happystudy2.happystudy2management.core.domain.vo.LoginParam;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.domain.dto.login.LoginDTO;
import com.happystudy2.happystudy2management.domain.vo.login.LoginVO;
import com.happystudy2.happystudy2management.factory.ResultDataFactory;
import com.happystudy2.happystudy2management.loginCenter.Authenticator;
import com.happystudy2.happystudy2management.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private Authenticator authenticator;
    @Autowired
    private TypeMapper typeMapper;

    @RequestMapping("/login")
    public String index(){
        return "login/login";
    }
    @RequestMapping("/regist")
    public String toRegist(HttpServletRequest request){
        return "login/regist";
    }
    @RequestMapping("/updater")
    public String toUpdater(HttpServletRequest request){
        return "login/updater";
    }

    @PostMapping("/do/login")
    @ResponseBody
    public ResultData<LoginVO> doLogin(@RequestBody LoginDTO loginDTO, HttpServletRequest httpServletRequest){
        String username = loginDTO.getUsername();
        String password = loginDTO.getPassword();
        if (StringUtils.isBlank(username)){
            ResultDataFactory resultDataFactory = new ResultDataFactory();
            return resultDataFactory.error("缺少用户凭证");
        }
        if (StringUtils.isBlank(password)){
            ResultDataFactory resultDataFactory = new ResultDataFactory();
            return resultDataFactory.error("缺少验证密钥");
        }

        LoginParam loginResult = authenticator.login(username, password);
        if (loginResult.getSuccess()){
        //    UserController.userMap.put(username, loginResult.getCurrentUser());
        //    httpServletRequest.getSession().setAttribute(UserController.CURRENT_USER_KEY, username);
        }

        ResultDataFactory resultDataFactory = new ResultDataFactory(typeMapper.map(loginResult, LoginVO.class));
        return resultDataFactory.success(loginResult.getDescription());
    }
}
