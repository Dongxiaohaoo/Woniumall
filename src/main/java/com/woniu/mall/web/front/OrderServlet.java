package com.woniu.mall.web.front;


import com.alibaba.fastjson.JSON;
import com.woniu.mall.entity.*;
import com.woniu.mall.service.*;
import com.woniu.mall.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    AddressService as = ServiceProxyFactory.getProxy(AddressService.class);
    OrderItemService ois = ServiceProxyFactory.getProxy(OrderItemService.class);
    GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);
    OrderService os = ServiceProxyFactory.getProxy(OrderService.class);
    CartService cs = ServiceProxyFactory.getProxy(CartService.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("order_add")){
            order_add(req,resp);
        }else if (opr.equals("order_submit")){
            order_submit(req,resp);
        }else if(opr.equals("getDetail")){
            getDetail(req,resp);
        }
    }

    //获得订单详情
    private void getDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order order = os.getOrderById(id);
        String orderno = req.getParameter("orderno");
        List<OrderItem> orderItemList = ois.queryOrderItemListByOrderId(id);
        req.setAttribute("order",order);
        req.setAttribute("orderItemList",orderItemList);
        req.getRequestDispatcher("/usercenter/order_view.jsp").forward(req,resp);
    }

    //提交订单
    private void order_submit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] goodsids = req.getParameterValues("goodsid");
        String[] goodsnums = req.getParameterValues("goodsnum");
        String cartid = req.getParameter("cartids");

        String addressId = req.getParameter("order.address.id");

        //判断是否选择过地址
        if (addressId == null || addressId.equals("")){
            req.setAttribute("msg","您尚未选择收货地址，请选择后重新购买;");
            req.getRequestDispatcher("/order_error.jsp").forward(req,resp);
            return;
        }

        User user = (User) req.getSession().getAttribute("user");
        String formToken = req.getParameter("token");
        String orderDeliveryType = req.getParameter("order.deliveryType");
        //根据用户ID和地址ID查询地址
        Address address = as.getAddressByUserIdAndAddressId(user.getId(),addressId);
        String payType = req.getParameter("order.payType");
        String totalMoney = req.getParameter("order.totalMoney");
        List<OrderItem> orderItemList = new ArrayList<>();
        for (int i = 0; i < goodsids.length; i++) {
            OrderItem orderItem = new OrderItem();
            orderItem.setGoodsid(Integer.parseInt(goodsids[i]));
            orderItem.setNum(Integer.parseInt(goodsnums[i]));
            Goods goodsById = gs.getGoodsById(Integer.parseInt(goodsids[i]));
            orderItem.setPrice((goodsById.getSaleprice().multiply(new BigDecimal(goodsnums[i]))).toString());
            orderItemList.add(orderItem);
        }
        Order order = new Order();
        order.setNo(DateUtil.getGoodsNo());
        order.setUserid(user.getId());
        order.setUsername(user.getUsername());
        order.setOrdertime(DateUtil.getDate());
        order.setPaytype(payType);
        order.setPaytime(null);
        order.setReceivetime(DateUtil.getDate());
        order.setTotalmoney(new BigDecimal(totalMoney));
        order.setAddress(address.getProvince()+"-"+address.getCity()+"-"+address.getArea()+"-"+address.getStreet());
        order.setAccept(address.getAccept());
        order.setTelephone(address.getTelephone());
        order.setStatus(Order.WAITPAYMENT);

        String sestoken = (String) req.getSession().getAttribute("token");
        //减库存
        boolean f = os.reduStock(orderItemList);
        if (!f){
            req.setAttribute("msg","您购买的部分商品库存不足，请查看后重新选择;");
            req.getRequestDispatcher("/order_error.jsp").forward(req,resp);
            return;
        }
        //加积分


        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        //如果刷新提交，那么js提醒
        if (sestoken != null || formToken.equals(sestoken)){
            req.getSession().removeAttribute("token");
            if (cartid != null && !cartid.equals("")){
                String[] cartids = cartid.split(",");
                cs.delCart(cartids);
            }
            //不是刷新提交，那么就创建订单，删除购物车记录
            os.addOrder(order,orderItemList);
        }else {
            order = os.queryOrderById(os.getOrderId());
        }
        //数据转发给新页面
        req.setAttribute("order",order);
        req.getRequestDispatcher("/order_submit.jsp").forward(req,resp);
    }

    //添加订单
    private void order_add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] goodsids = req.getParameterValues("goodsid");
        String[] goodsnums = req.getParameterValues("goodsnum");
        String[] cartids = req.getParameterValues("cartid");
        //获取会话作用域中的对象
        User user = (User) req.getSession().getAttribute("user");
        List<Address> userAddress = as.getUserAddress(user);
        List<OrderItem> orderItemList = ois.getOrderItemsForOrderAdd(goodsids,goodsnums);

        StringJoiner cartString = new StringJoiner(",");

        req.setAttribute("orderItemList",orderItemList);
        //设置用户的收货地址
        req.setAttribute("addresses",userAddress);
        String token = DateUtil.getToken();
        req.getSession().setAttribute("token",token);
        req.setAttribute("token",token);
        try {
            for (int i = 0; i < cartids.length; i++) {
                cartString.add(cartids[i]);
            }
            req.setAttribute("cartids",cartString);
        } catch (Exception e) {
            req.setAttribute("cartids",null);
            e.printStackTrace();
        }
        req.getRequestDispatcher("/order_add.jsp").forward(req,resp);

    }
}
