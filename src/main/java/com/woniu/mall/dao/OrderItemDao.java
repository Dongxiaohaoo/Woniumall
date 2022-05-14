package com.woniu.mall.dao;

import com.woniu.mall.entity.OrderItem;

import java.util.List;

public interface OrderItemDao {
    List<OrderItem> queryOrderItemListByOrderId(Integer orderid);

    void addOrderItem(OrderItem orderItem);

    List<OrderItem> getOrderItemByOrderId(String id);
}
