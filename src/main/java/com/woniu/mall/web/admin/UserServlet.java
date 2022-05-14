package com.woniu.mall.web.admin;

import com.github.pagehelper.PageInfo;
import com.woniu.mall.entity.User;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
    UserService us = ServiceProxyFactory.getProxy(UserService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("getAll")){
            queryAllUser(req,resp);
        }else if (opr.equals("updateUserStatus")){
            updateUserStatus(req,resp);
        }
    }

    //修改状态
    private void updateUserStatus(HttpServletRequest req, HttpServletResponse resp) {
        String status = req.getParameter("status");//需要操作的状态
        String id = req.getParameter("id");//用户id
        User user = us.queryUserById(Integer.parseInt(id));
        user.setStatus(status);
        us.updateStatus(user);
        //刷新列表
        queryAllUser(req, resp);
    }

    //获取所有列表
    private void queryAllUser(HttpServletRequest req, HttpServletResponse resp) {
        //获取页数页码
        String page = req.getParameter("page");
        String pageSize = req.getParameter("pageSize");
        //获取页面条件
        String status = req.getParameter("status1"); //用户状态
        String title = req.getParameter("title");   //用户名
        User user = new User();
        user.setStatus(status);
        user.setUsername(title);

        Integer pageNum = 1;//页码数
        Integer pSize = 5;//每页容量
        if (page != null &&!page.equals("")){
            pageNum = Integer.parseInt(page);
        }
        if (pageSize != null &&!pageSize.equals("")){
            pSize = Integer.parseInt(pageSize);
        }

        PageInfo<User> userPageInfo = us.queryAllUser(pageNum,pSize,user);
        List<User> users = userPageInfo.getList();
        //将拦截器回传给前端
        req.setAttribute("userPageInfo",userPageInfo);
        req.setAttribute("pageSize",pSize);
        req.setAttribute("users",users);
        req.setAttribute("status1",status);
        req.setAttribute("name",title);
        try {
            req.getRequestDispatcher("/admin/user_list.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("刷新列表失败");
        }
    }
}
