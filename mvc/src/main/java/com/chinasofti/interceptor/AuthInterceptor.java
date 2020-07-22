package com.chinasofti.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //过滤掉ajax请求
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
            return true;
        } else {
           String authUrls = (String)request.getSession().getAttribute("authUrls");
           if(!authUrls.contains(request.getRequestURI().substring(request.getContextPath().length()))){
               response.sendRedirect(request.getContextPath()+"/page/noAuth.action");
               return  false;
           }
        }
        return true;
    }
}
