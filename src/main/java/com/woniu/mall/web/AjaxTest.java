package com.woniu.mall.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ajaxTest")
public class AjaxTest extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qq = req.getParameter("qq");
        String name = "";
        String year = "";

        if (qq.equals("145136")){
            name = "董昊";
            year = "20";
        }else if (qq.equals("29633886")){
            name = "qiqi";
            year = "10";
        }else {
            name = "其他";
            year = "其他";
        }
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println(name+","+year);
    }
}
