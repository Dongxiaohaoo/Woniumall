package com.woniu.mall.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;
import com.woniu.mall.dao.GoodsDao;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.util.DateUtil;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class GoodsService {
    //根据类别id查商品
    public List<Goods> getGoodsByCategoryId(Integer id){
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        List<Goods> goods = mapper.queryByCategoryId(id);
        return goods;
    }

    ////查询所有商品
    //public List<Goods> getAllGoods(){
    //    GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
    //    List<Goods> goods = mapper.queryAllGoods();
    //    return goods;
    //}

    //分页查询
    public PageInfo getGoodsByPage(Integer pageNum,Integer pageSize,Goods goods){
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        //设置起始页终止页
        PageHelper.startPage(pageNum,pageSize);//起始页，每页条数
        //设置之后 再查寻就会分页
        List<Goods> goods1 = mapper.queryAllGoods(goods);
        PageInfo<Goods> pageInfo = new PageInfo<>(goods1);
        return pageInfo;
    }

    //批量删除
    public void delByid(Integer[] stringToInt) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        mapper.delByid(stringToInt);
    }

    //添加商品
    public void addGoods(Goods goods) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        goods.setUptime(DateUtil.getDate());
        goods.setNo(DateUtil.getGoodsNo());
        goods.setStatus(Goods.NORMAL);
        mapper.addGoods(goods);

    }

    //批量下架
    public void soldOut(Integer[] stringToInt,String date) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        mapper.soldOut(stringToInt,date);
    }

    //批量上架
    public void shelves(Integer[] stringToInt,String date) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        mapper.shelves(stringToInt,date);
    }

    //根据id查商品
    public Goods getGoodsById(int parseInt) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        Goods goodsById = mapper.getGoodsById(parseInt);
        return goodsById;
    }

    //修改商品
    public void updateGoods(Goods goodsById) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        String image = goodsById.getImage();
        System.out.println("server层"+image);
        mapper.updateGoods(goodsById);

    }

    //获取最新商品
    public List<Goods> getNewGoods(Integer i) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        List<Goods> goodsList = mapper.getNewGoods(i);
        return goodsList;
    }

    public List<Goods> getHotGoods(Integer i) {
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        List<Goods> goodsList = mapper.getHotGoods(i);
        return goodsList;
    }


    public PageInfo<Goods> getGoodsByName(String name,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        GoodsDao mapper = MybatisUtil.getConn().getMapper(GoodsDao.class);
        List<Goods> goodsList = mapper.getGoodsByName(name);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        return goodsPageInfo;
    }
}
