package com.woniu.mall.dao;

import com.woniu.mall.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    //管理员登录
    Admin login(@Param("account") String account,@Param("password") String password);
    Admin queryByUsername(String username);
}
