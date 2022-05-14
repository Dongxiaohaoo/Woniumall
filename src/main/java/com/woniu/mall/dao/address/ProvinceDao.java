package com.woniu.mall.dao.address;

import com.woniu.mall.entity.address.Province;

import java.util.List;

public interface ProvinceDao {
    List<Province> queryAllProvince(String code);
}
