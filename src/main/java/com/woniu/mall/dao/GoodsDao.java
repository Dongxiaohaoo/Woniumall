package com.woniu.mall.dao;

import com.woniu.mall.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {
    //根据CategoryId查商品
    List<Goods> queryByCategoryId(Integer id);

    //查询所有商品
    List<Goods> queryAllGoods(Goods goods);

    void delByid(Integer[] stringToInt);

    //添加商品
    void addGoods(Goods goods);

    //批量下架
    void soldOut(@Param("stringToInt") Integer[] stringToInt,@Param("Date") String date);

    //批量上架
    void shelves(@Param("stringToInt") Integer[] stringToInt,@Param("Date") String date);

    //根据商品id查商品
    Goods getGoodsById(int parseInt);

    //修改商品
    void updateGoods(Goods goodsById);

    List<Goods> getNewGoods(Integer i);

    List<Goods> getHotGoods(Integer i);

    List<Goods> getGoodsByName(String name);
}
