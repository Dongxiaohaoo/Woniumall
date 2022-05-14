package com.woniu.mall.test;

import com.woniu.mall.dao.CategoryDao;
import com.woniu.mall.dao.GoodsDao;
import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.util.DateUtil;
import com.woniu.mall.util.MybatisUtil;
import org.junit.Test;

import java.util.List;

public class CategoryTest {

    @Test
    public void queryAllTest(){
        CategoryDao mapper = MybatisUtil.getConn().getMapper(CategoryDao.class);
        List<Category> categories = mapper.queryAllCategory();
        for (Category category : categories) {
            System.out.println(category);
        }
    }

    @Test
    public void date(){
        String date = DateUtil.getDate();
        System.out.println(date);
    }

}
