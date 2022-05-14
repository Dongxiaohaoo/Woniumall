package com.woniu.mall.service.address;

import com.woniu.mall.dao.AdminDao;
import com.woniu.mall.dao.address.ProvinceDao;
import com.woniu.mall.entity.Admin;
import com.woniu.mall.entity.address.Province;
import com.woniu.mall.exception.AdminUsernameAlreadyExistException;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class ProvinceService {

    public List<Province> getAll(String code){
        ProvinceDao mapper = MybatisUtil.getConn().getMapper(ProvinceDao.class);
        List<Province> provinces = mapper.queryAllProvince(code);
        return provinces;
    }

    //判断用户名是否重复
    public Admin queryByUsername(String username){
        AdminDao mapper = MybatisUtil.getConn().getMapper(AdminDao.class);
        Admin admin = mapper.queryByUsername(username);
        if (admin!=null){
            throw new AdminUsernameAlreadyExistException("账号已被使用！");
        }
        return admin;
    }
}
