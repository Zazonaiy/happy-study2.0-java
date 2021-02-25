package com.happystudy2.happystudy2management.interceptor.user;

import com.happystudy2.happystudy2management.controller.UserController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Component
public class UserInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        if (handler instanceof HandlerMethod){
            Subject subject = SecurityUtils.getSubject();

            //if (Objects.isNull(subject)){
            //    response.sendRedirect(request.getAttribute("ctxPath")+"/login");
            //    return false;
            //}
            //Boolean test = subject.hasRole("admin");
            //Boolean test2 = subject.hasRole("teacher");
            return true;
            //if (!subject.isAuthenticated()){
            //    response.sendRedirect(request.getAttribute("ctxPath")+"/login");
            //    return false;
            //}

        }
        return true;
    }

    /*
    @Deprecated
    private Subject getCurrentUser(HttpSession session){
        Object obj = session.getAttribute(UserController.CURRENT_USER_KEY);
        if (Objects.isNull(obj)){
            return null;
        }
        String username = (String)obj;
        Subject subject = UserController.userMap.get(username);
        return subject;
    }

     */
}
