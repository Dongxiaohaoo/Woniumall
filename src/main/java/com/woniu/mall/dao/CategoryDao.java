package com.woniu.mall.dao;

import com.woniu.mall.entity.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> queryAllCategory();

    Category getById(Integer id);

    void insert(Category category);

    void update(Category category);

    void dellById(Integer id);

    //根据名字查是否重复
    Category queryByName(Category category);

    Category queryById(Category c);

    List<Category> queryNormalCategory();
}
