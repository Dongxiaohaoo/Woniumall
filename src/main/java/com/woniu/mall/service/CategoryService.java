package com.woniu.mall.service;

import com.woniu.mall.dao.CategoryDao;
import com.woniu.mall.dao.GoodsDao;
import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.exception.CategoryAlreadyExistException;
import com.woniu.mall.exception.GoodsNotEmptyErrorException;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class CategoryService {

    public void addCategory(Category category) {
        CategoryDao mapper = MybatisUtil.getConn().getMapper(CategoryDao.class);
        Category c = mapper.queryByName(category);
        if (c != null){
            throw new CategoryAlreadyExistException("添加失败！该类别已存在");
        }
        category.setStatus(Category.NOMARL);
        mapper.insert(category);
    }

    //查询所有列表
    public List<Category> getAllCategory(){
        CategoryDao mapper = MybatisUtil.getConn().getMapper(CategoryDao.class);
        List<Category> categories = mapper.queryAllCategory();
        return categories;
    }

    //删除列表
    public void delCategory(Integer id){
        CategoryDao categorydao = MybatisUtil.getConn().getMapper(CategoryDao.class);
        GoodsDao goodsdao = MybatisUtil.getConn().getMapper(GoodsDao.class);
        List<Goods> goods = goodsdao.queryByCategoryId(id);
        if (goods.size() != 0){
            throw new GoodsNotEmptyErrorException("该分类下还有商品未清空！");
        }
        categorydao.dellById(id);
    }

    //修改
    public void updateCategory(Category c){
        CategoryDao categorydao = MybatisUtil.getConn().getMapper(CategoryDao.class);
        Category category = categorydao.queryByName(c);
            if (category != null && c.getStatus().equals(category.getStatus())){
                throw new CategoryAlreadyExistException("修改的名称已存在！");
            }
        categorydao.update(c);
    }

    //根据id查Category
    public Category getCategoryById(Integer id){
        CategoryDao categorydao = MybatisUtil.getConn().getMapper(CategoryDao.class);
        Category byId = categorydao.getById(id);
        return byId;
    }

    public List<Category> queryNormalCategory(){
        CategoryDao categorydao = MybatisUtil.getConn().getMapper(CategoryDao.class);
        List<Category> categoryList = categorydao.queryNormalCategory();
        return categoryList;
    }
}
