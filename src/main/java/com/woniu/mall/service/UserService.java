package com.woniu.mall.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mall.dao.UserDao;
import com.woniu.mall.entity.User;
import com.woniu.mall.exception.UsernameAlreadyExistException;
import com.woniu.mall.exception.UsernameOrPasswordErrorException;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class UserService {

    public PageInfo<User> queryAllUser(Integer pageNum, Integer pSize, User user) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        PageHelper.startPage(pageNum, pSize);
        List<User> users = mapper.queryAllUser(user);
        PageInfo<User> userPageInfo = new PageInfo<>(users);
        return userPageInfo;
    }

    public User queryUserById(Integer id) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        User userById = mapper.getUserById(id);
        return userById;
    }

    public void updateStatus(User user) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        mapper.updateStatus(user);
    }

    public void addUser(User user) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        mapper.addUser(user);
    }

    public void queryByAccount(String account) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        User user = mapper.queryByAccount(account);
        if (user != null) {
            throw new UsernameAlreadyExistException("用户名已存在...");
        }
    }

    public User login(String account, String password) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        User user = mapper.login(account, password);
        String error = "";
        if (user == null) {
            error = "账号或密码错误！";
            throw new UsernameOrPasswordErrorException(error);
        }
        if (user.getStatus().equals(User.ACTIVATE)) {
            error = "账号未激活！";
            throw new UsernameOrPasswordErrorException(error);
        }
        if (user.getStatus().equals(User.LOCKED)) {
            error = "账号已锁定";
            throw new UsernameOrPasswordErrorException(error);
        }
        return user;
    }

    public void activation(User user) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        mapper.activation(user);
    }

    public void updateAvatar(User user){
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        mapper.updateAvatar(user);
    }

    public void updatePassword(User user){
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        mapper.updatePassword(user);
    }

    public void queryByEmail(String email) {
        UserDao mapper = MybatisUtil.getConn().getMapper(UserDao.class);
        User user = mapper.queryByEmail(email);
        if (user != null) {
            throw new UsernameAlreadyExistException("该邮箱已被注册...");
        }
    }
}
