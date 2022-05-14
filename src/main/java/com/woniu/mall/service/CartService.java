package com.woniu.mall.service;

import com.woniu.mall.dao.CartDao;
import com.woniu.mall.entity.Cart;
import com.woniu.mall.entity.User;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class CartService {

    /**
     * 添加购物信息
     * 注意：需判断是否首次添加
     * @param cart
     */
    public void addCart(Cart cart) {
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        /*
            这个cart是用来判断 这个用户是否添加过这个商品
            如果为null，那么就insert
            如果非空，在它的基础上update
         */
        Cart queryCart = mapper.queryByUseridAndGoodsId(cart.getUserid(),cart.getGoodsid());

        if (queryCart != null){
            //查到的数量 加上传进来的数量,更新数量
            Integer newNum = queryCart.getNum() + cart.getNum();
            //更新数量
            mapper.updateCart(newNum,queryCart.getId());
            return;
        }
        //如果没查到 就添加记录
        mapper.add(cart);
    }

    /**
     * 查询一个用户所有的购物车记录，用来记录条数
     * @return
     */
    public List<Cart> queryAllCart(User user){
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        List<Cart> carts = mapper.queryUserCart(user);
        return carts;
    }

    public void updateIschecked(String id, String status) {
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        mapper.updateIschecked(id,status);

    }

    //更新购物车数量
    public void updateCartNum(String id, String num) {
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        mapper.updateCartNum(id,num);
    }

    //删除购物车记录
    public void delCart(String id) {
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        mapper.delCart(id);
    }

    //批量删除购物车记录
    public void delCart(String[] id){
        CartDao mapper = MybatisUtil.getConn().getMapper(CartDao.class);
        for (String s : id) {
            mapper.delCart(s);
        }
    }
}
