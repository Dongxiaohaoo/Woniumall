package com.woniu.mall.service;

import com.woniu.mall.dao.GoodsDao;
import com.woniu.mall.dao.OrderItemDao;
import com.woniu.mall.entity.OrderItem;
import com.woniu.mall.util.MybatisUtil;

import java.util.ArrayList;
import java.util.List;

public class OrderItemService {

    //传来数组 返回订单项集合
    public List<OrderItem> getOrderItemsForOrderAdd(String[] goodsids, String[] goodsnums) {
        //直接调数据层，防止被关闭
        GoodsDao queryGoods = MybatisUtil.getConn().getMapper(GoodsDao.class);

        OrderItemDao mapper = MybatisUtil.getConn().getMapper(OrderItemDao.class);
        List<OrderItem> orderItemList = new ArrayList<>();
        for (int i = 0; i < goodsids.length; i++) {
            OrderItem oi = new OrderItem();
            oi.setGoods(queryGoods.getGoodsById(Integer.parseInt(goodsids[i])));
            oi.setNum(Integer.parseInt(goodsnums[i]));
            orderItemList.add(oi);
        }
        return orderItemList;
    }

    public List<OrderItem> queryOrderItemListByOrderId(String id) {
        Integer d = Integer.parseInt(id);
        OrderItemDao mapper = MybatisUtil.getConn().getMapper(OrderItemDao.class);
        List<OrderItem> orderItemList = mapper.queryOrderItemListByOrderId(d);
        return orderItemList;
    }
}
