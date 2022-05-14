package com.woniu.mall.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class OnlineNumListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("sessionCreated");
        ServletContext sc = se.getSession().getServletContext();
        Integer count = (Integer) sc.getAttribute("count");
        if (count == null){
            count = 1;
        }else {
            count++;
        }

        sc.setAttribute("count",count);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("sessionDestroyed");
        ServletContext sc = se.getSession().getServletContext();
        Integer count = (Integer) sc.getAttribute("count");
        if (count == null){
            count = 0;
        }else {
            count--;
        }
        sc.setAttribute("count",count);

    }
}
