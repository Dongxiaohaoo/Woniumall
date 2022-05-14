package com.woniu.mall.service;

import com.woniu.mall.dao.AdminDao;
import com.woniu.mall.entity.Admin;
import com.woniu.mall.exception.AdminUsernameAlreadyExistException;
import com.woniu.mall.exception.UsernameOrPasswordErrorException;
import com.woniu.mall.util.MybatisUtil;

public class AdminService {
    //管理员登录
    public Admin login(String account,String password){
        AdminDao mapper = MybatisUtil.getConn().getMapper(AdminDao.class);
        Admin admin = mapper.login(account,password);
        if (admin == null){
            throw new UsernameOrPasswordErrorException("账号或密码错误！");
        }
        return admin;
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
