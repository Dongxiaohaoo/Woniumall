package com.woniu.mall.filter;

import com.woniu.mall.entity.Admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //先获取HttpServletRequest

        HttpServletRequest req = (HttpServletRequest) request;//父类强转成子类
        HttpServletResponse resp = (HttpServletResponse) response;//父类强转成子类
        Admin login = (Admin) req.getSession().getAttribute("login"); //获取登录对象
        req.setCharacterEncoding("utf-8");
        String opr = req.getParameter("opr");//放行登录请求
        System.out.println(login);
        String requestURI = req.getRequestURI();
        System.out.println(requestURI);

        //String requestType = req.getHeader("X-Requested-With");
        //
        //if (requestType != null && requestType.equalsIgnoreCase("XMLHttpRequest")) {
        //
        //    //是XMLHttpRequest则为Ajax请求
        //    PrintWriter writer = resp.getWriter();
        //    writer.println("hello,123");
        //
        //}

        if (requestURI.endsWith("/login.jsp") || (opr != null && opr.equals("login")) || (opr != null && opr.equals("logout"))){
            chain.doFilter(request,response);
            return;
        }

        if (requestURI.endsWith("/admin/login") || requestURI.endsWith("/admin") || requestURI.endsWith("/admin/")){
            req.getRequestDispatcher("/admin/login.jsp").forward(request,response);
            return;
        }

        if (login == null){
            req.setAttribute("msg","请登录后操作！");
            req.getRequestDispatcher("/admin/login.jsp").forward(request,response);
        }else {
            //放行
            chain.doFilter(request,response);
        }

    }

    @Override
    public void destroy() {

    }
}
