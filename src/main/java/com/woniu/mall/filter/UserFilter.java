package com.woniu.mall.filter;

import com.alibaba.fastjson.JSON;
import com.woniu.mall.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/*

 */
@WebFilter({"/cart"})
public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //强制转型
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("user");
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        //没登陆就转到登陆界面
        if (user == null){
            //resp.sendRedirect("login.jsp");
            Map<String,String> res = new HashMap<>();
            //状态码1则跳转登录
            res.put("status","1");
            String s = JSON.toJSONString(res);
            writer.println(s);
            return;
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
