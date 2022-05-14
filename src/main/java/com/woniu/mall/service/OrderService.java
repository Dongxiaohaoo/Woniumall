package com.woniu.mall.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;
import com.sun.org.apache.xpath.internal.operations.Or;
import com.woniu.mall.dao.GoodsDao;
import com.woniu.mall.dao.OrderDao;
import com.woniu.mall.dao.OrderItemDao;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.entity.Order;
import com.woniu.mall.entity.OrderItem;
import com.woniu.mall.entity.User;
import com.woniu.mall.util.MybatisUtil;

import java.math.BigDecimal;
import java.util.List;

public class OrderService {
    private Integer orderId = null;

    public PageInfo<Order> getAllOrder(Integer pageNum,Integer pageSize,Order order){
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = mapper.getList(order);
        PageInfo<Order> orderPageInfo = new PageInfo<>(orderList);
        return orderPageInfo;
    }

    /**
     * 查询某个用户的所有订单
     * @param user
     * @return
     */
    public List<Order> getAllOrder(User user){
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        List<Order> orderList = mapper.queryOrderByUserId(user.getId());
        return orderList;
    }

    //根据id查订单号
    public Order queryOrderById(int parseInt) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        Order order = mapper.queryOrderById(parseInt);
        return order;
    }

    public void senGoods(int parseInt) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        mapper.senGoods(parseInt);
    }


    public void addOrder(Order order, List<OrderItem> orderItemList){
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        OrderItemDao oi = MybatisUtil.getConn().getMapper(OrderItemDao.class);
        //添加之后可以获得订单id
        mapper.addOreder(order);
        Integer id = order.getId();
        for (int i = 0; i < orderItemList.size(); i++) {
            OrderItem orderItem = orderItemList.get(i);
            orderItem.setOrderid(id);
            oi.addOrderItem(orderItem);
        }
        this.orderId = order.getId();
    }

    public Integer getOrderId(){
        return this.orderId;
    }

    //设置等待付款的集合
    public List<Order> getWaitPayment(User user) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        List<Order> orderList = mapper.getWaitPayment(user);
        return orderList;
    }

    //已完成的订单总金额
    public String getAlreadySpend(User user) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        List<Order> orderList = mapper.getAlreadyPay(user);
        BigDecimal bigDecimal = new BigDecimal("0");
        for (Order order : orderList) {
            BigDecimal totalmoney = order.getTotalmoney();
            bigDecimal = bigDecimal.add(totalmoney);
        }
        return bigDecimal.toString();
    }

    //几种订单状态数量
    public String getOrderStatusNums(String status,User user) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        List<Order> orderList = mapper.getOrderStatusNums(status,user);
        BigDecimal bigDecimal = new BigDecimal("0");
        for (Order order : orderList) {
            BigDecimal totalmoney = order.getTotalmoney();
            bigDecimal = bigDecimal.add(totalmoney);
        }
        return bigDecimal.toString();
    }

    public boolean reduStock(List<OrderItem> orderItemList) {
        OrderDao orderDao = MybatisUtil.getConn().getMapper(OrderDao.class);
        for (OrderItem orderItem : orderItemList) {
            //获得商品id
            Integer goodsid = orderItem.getGoodsid();
            GoodsDao goodsDao = MybatisUtil.getConn().getMapper(GoodsDao.class);
            Goods goodsById = goodsDao.getGoodsById(goodsid);
            //获得库存数
            Integer stock = goodsById.getStock();
            //如果库存小于已存在数量，那么中止订单
            if (stock < orderItem.getNum()){
                return false;
            }
            //更新商品数量
            goodsById.setStock((stock-orderItem.getNum()));
            goodsDao.updateGoods(goodsById);
        }
        return true;
    }

    //根据id查订单
    public Order getOrderById(String id) {
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        Order order = mapper.getOrderById(id);
        return order;
    }
}


