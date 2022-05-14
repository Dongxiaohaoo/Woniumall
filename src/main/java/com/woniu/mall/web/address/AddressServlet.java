package com.woniu.mall.web.address;

import com.woniu.mall.entity.Admin;
import com.woniu.mall.entity.address.Province;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.service.address.ProvinceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {
    ProvinceService PS = ServiceProxyFactory.getProxy(ProvinceService.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("方法到达....");
        String superior = req.getParameter("superior");
        //查询用户名
        String username = req.getParameter("username");

        Admin admin = PS.queryByUsername(username);

        System.out.println(superior);
        StringBuffer sb = new StringBuffer();
        List<Province> all = PS.getAll(superior);
        resp.setContentType("text/html;charset=utf-8");
        for (Province province : all) {
            sb.append(province.getContent()+","+province.getCode()+";");
        }
        PrintWriter writer = resp.getWriter();
        writer.print(sb);
        writer.println(admin);
    }
}
