package com.woniu.mall.entity;

import java.math.BigDecimal;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private Integer score;
    private String regtime;
    private BigDecimal money;
    private String avatar;
    private String status;
    private String phone;

    //0正常 1待激活 2锁定
    public static final String NORMAL = "0";
    public static final String ACTIVATE = "1";
    public static final String LOCKED = "2";

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", score=" + score +
                ", regtime='" + regtime + '\'' +
                ", money=" + money +
                ", avatar='" + avatar + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getRegtime() {
        return regtime;
    }

    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User(Integer id, String username, String password, String email, Integer score, String regtime, BigDecimal money, String avatar, String status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.score = score;
        this.regtime = regtime;
        this.money = money;
        this.avatar = avatar;
        this.status = status;
    }

    public User() {
    }
}
