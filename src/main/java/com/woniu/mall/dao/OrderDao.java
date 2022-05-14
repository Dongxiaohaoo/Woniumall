package com.woniu.mall.dao;

import com.woniu.mall.entity.Order;
import com.woniu.mall.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    //查询所有列表
    List<Order> getList(Order order);

    //根据id查订单
    Order queryOrderById(int parseInt);

    void senGoods(int parseInt);

    void addOreder(Order order);

    //根据用户id查他的订单
    List<Order> queryOrderByUserId(Integer id);

    //获得待付款的订单集合
    List<Order> getWaitPayment(User user);

    //获得已支付的订单集合
    List<Order> getAlreadyPay(User user);

    //几种订单状态数量
    List<Order> getOrderStatusNums(@Param("status") String status,@Param("user") User user);

    Order getOrderById(String id);
}
