package com.woniu.mall.dao;

import com.woniu.mall.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //id查用户
    User getUserById(Integer id);

    //修改状态
    void updateStatus(User user);

    //查询所有用户
    List<User> queryAllUser(User user);

    //添加用户
    void addUser(User user);

    User queryByAccount(String account);

    //登录查询
    User login(@Param("account") String account,@Param("password") String password);

    //激活用户
    void activation(User user);

    //修改头像
    void updateAvatar(User user);

    //修改密码
    void updatePassword(User user);

    //根据邮箱查用户
    User queryByEmail(String email);
}
