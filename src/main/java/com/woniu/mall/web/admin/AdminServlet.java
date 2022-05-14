package com.woniu.mall.web.admin;

import com.woniu.mall.entity.Admin;
import com.woniu.mall.exception.MyServiceException;
import com.woniu.mall.service.AdminService;
import com.woniu.mall.service.ServiceProxyFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminServlet extends HttpServlet {
    AdminService as = ServiceProxyFactory.getProxy(AdminService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr == null){
            redirect(req,resp);
        }else if (opr.equals("login")){
            login(req,resp);
        }else if(opr.equals("logout")){
            logout(req,resp);
        }
    }

    //退出登录
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println("开始退出登录");
        //移除登录会话
        //req.getSession().removeAttribute("login");
        req.getSession().invalidate();
        //跳转到登陆页面
        req.getRequestDispatcher("/admin/login.jsp").forward(req,resp);
    }

    //直接访问 请求转发到登陆页面
    private void redirect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("count",1);
        req.getRequestDispatcher("/admin/login.jsp").forward(req,resp);
    }

    //管理员登录
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");
        try {
            Cookie ck1 = new Cookie("account",account);
            Cookie ck2 = new Cookie("password",password);
            Admin login = as.login(account, password);
            req.getSession().setAttribute("login",login);
            if (rememberMe != null && rememberMe.equals("on")){
                ck1.setMaxAge(60);
                ck2.setMaxAge(60);
            }else {
                ck1.setMaxAge(0);
                ck2.setMaxAge(0);
            }
                resp.addCookie(ck1);
                resp.addCookie(ck2);
            //重定向到登录页面 cookie回传,设置最大存活时间，单位秒
            req.getRequestDispatcher("/admin/home.jsp").forward(req,resp);
        } catch (Exception e) {
            if (e instanceof MyServiceException){
                req.setAttribute("msg",e.getMessage());
            }else {
                req.setAttribute("msg","系统繁忙 登陆失败！");
            }
            req.getRequestDispatcher("/admin/login.jsp").forward(req,resp);
            e.printStackTrace();
        }
    }
}
