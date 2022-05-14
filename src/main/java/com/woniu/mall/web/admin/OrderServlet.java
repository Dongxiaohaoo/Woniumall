package com.woniu.mall.web.admin;

import com.github.pagehelper.PageInfo;
import com.woniu.mall.entity.Order;
import com.woniu.mall.entity.OrderItem;
import com.woniu.mall.service.OrderService;
import com.woniu.mall.service.ServiceProxyFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/order")
public class OrderServlet extends HttpServlet {
    OrderService os = ServiceProxyFactory.getProxy(OrderService.class);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("getAll")){
            getAll(req,resp);
        }else if (opr.equals("details")){
            details(req,resp);
        }else if (opr.equals("sendGoods")){
            sendGoods(req,resp);
        }
    }

    //发货接口
    private void sendGoods(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        os.senGoods(Integer.parseInt(id));
    }

    //订单详情按钮接口
    private void details(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        Order order = os.queryOrderById(Integer.parseInt(orderId));
        //一整个订单
        req.setAttribute("order",order);
        List<OrderItem> orderItemList = order.getOrderItemList();
        //整个订单下面的订单项
        req.setAttribute("orderItemList",orderItemList);
        req.setAttribute("orderItemListSize",orderItemList.size());
        System.out.println(orderItemList);

        req.getRequestDispatcher("/admin/order_item.jsp").forward(req,resp);
    }

    //获取所有列表
    private void getAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pSize = req.getParameter("pageSize");
        String page = req.getParameter("page");
        //获得条件查询字段
        String status = req.getParameter("status");//状态
        String name = req.getParameter("title");//账号
        String lowerTime = req.getParameter("lowerTime");//时间上限
        String upperTime = req.getParameter("upperTime");//时间下限
        Order order = new Order();
        order.setStatus(status);
        order.setUsername(name);
        order.setLowerTime(lowerTime);
        order.setUpperTime(upperTime);

        Integer pageNum = 1;
        Integer pageSize = 5;
        if (pSize != null && !pSize.equals("")){
            pageSize = Integer.parseInt(pSize);
        }
        if (page != null && !page.equals("")){
            pageNum = Integer.parseInt(page);
        }


        PageInfo<Order> OrderInfo = os.getAllOrder(pageNum, pageSize,order);

        //回传页尺寸
        req.setAttribute("pageSize",pageSize);
        req.setAttribute("OrderInfo",OrderInfo);
        req.setAttribute("lowerTime",lowerTime);
        req.setAttribute("upperTime",upperTime);
        req.setAttribute("status",status);
        req.setAttribute("name",name);
        req.setAttribute("lowerTime",lowerTime);
        req.setAttribute("upperTime",upperTime);

        req.getRequestDispatcher("/admin/order_list.jsp").forward(req,resp);
    }
}
