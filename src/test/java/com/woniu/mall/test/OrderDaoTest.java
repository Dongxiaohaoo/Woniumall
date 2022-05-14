package com.woniu.mall.test;

import com.woniu.mall.dao.CartDao;
import com.woniu.mall.dao.OrderDao;
import com.woniu.mall.dao.OrderItemDao;
import com.woniu.mall.entity.*;
import com.woniu.mall.service.CategoryService;
import com.woniu.mall.service.GoodsService;
import com.woniu.mall.service.OrderService;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.util.DateUtil;
import com.woniu.mall.util.MybatisUtil;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

public class OrderDaoTest {
    @Test
    public void OrderTest(){
        OrderDao mapper = MybatisUtil.getConn().getMapper(OrderDao.class);
        Order order = mapper.queryOrderById(1);
        System.out.println(order.getOrderItemList());
    }

    @Test
    public void OrderItemTest(){
        GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);
        //List<Category> allCategory = cs.getAllCategory();
        //System.out.println(allCategory);
        List<Goods> NewGoodsList = gs.getGoodsByCategoryId(10);
        //System.out.println(orderItems.get(0).getGoods());
        System.out.println(NewGoodsList);
    }

    @Test
    public void CartTest(){
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        User user = new User();
        user.setId(48);
        List<Cart> carts = mapper.queryUserCart(user);
        for (Cart cart : carts) {
            System.out.println(cart.getAddtime());
        }
    }

    @Test
    public void TestAddOrder(){
        OrderService os = ServiceProxyFactory.getProxy(OrderService.class);
        Order order = new Order();
        order.setNo(DateUtil.getGoodsNo());
        order.setUserid(48);
        order.setUsername("hello");
        order.setOrdertime(DateUtil.getDate());
        order.setPaytype("1");
        order.setPaytime(DateUtil.getDate());
        order.setReceivetime(DateUtil.getDate());
        order.setTotalmoney(new BigDecimal("100"));
        order.setAddress("湖北");
        order.setAccept("张三");
        order.setTelephone("17683817443");
        order.setStatus(Order.WAITPAYMENT);
        //os.addOrder(order,null);
        System.out.println(order);
        String token = DateUtil.getToken();
        System.out.println(token);
    }

}
