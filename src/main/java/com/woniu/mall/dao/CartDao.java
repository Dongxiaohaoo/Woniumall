package com.woniu.mall.dao;

import com.woniu.mall.entity.Cart;
import com.woniu.mall.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {

    //查看用户是否有此条购物车记录
    Cart queryByUseridAndGoodsId(@Param("userid") Integer userid,@Param("goodsid") Integer goodsid);

    //添加购物记录
    void add(Cart cart);

    //更新商品数量
    void updateCart(@Param("num") Integer num,@Param("id") Integer id);

    //查询一个用户所有购物车
    List<Cart> queryUserCart(User user);

    //更新选中状态
    void updateIschecked(@Param("id") String id, @Param("status") String status);

    //更新数量
    void updateCartNum(@Param("id") String id,@Param("num") String num);

    void delCart(String id);
}
