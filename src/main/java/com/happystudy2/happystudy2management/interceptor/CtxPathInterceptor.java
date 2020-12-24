package com.happystudy2.happystudy2management.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class CtxPathInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod){
            setContextPath(request);
            request.setAttribute("sysTitle", "HappyStudy2.0");
        }

        return true;
    }

    private void setContextPath (HttpServletRequest request) {
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int port = request.getServerPort();
        String ctxPath = request.getContextPath();
        if (port == 80){
            ctxPath = scheme + "://" + serverName + ctxPath;
        }else{
            ctxPath = scheme + "://" + serverName + ":" + port + ctxPath;
        }

        request.setAttribute("ctxPath", ctxPath);
    }
}
