package com.qd.Intercepter;


import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIntercepter extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("开始之前！");
        System.out.println("开始之前！");
        String uri=request.getRequestURI();
        HttpSession session=request.getSession();
        if(session.getAttribute("user")=="admin" || uri.contains("login")||uri.contains("postData")){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("处理中！");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("处理之后！");
    }
}
