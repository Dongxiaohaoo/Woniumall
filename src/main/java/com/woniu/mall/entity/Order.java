package com.woniu.mall.entity;

import java.math.BigDecimal;
import java.util.List;

public class Order {
    private Integer id;
    private String no;
    private Integer userid;
    private String username;
    private String ordertime;
    private String paytype;
    private String paytime;
    private String receivetime;
    private BigDecimal totalmoney;
    private String address;
    private String accept;
    private String telephone;
    private String status;
    private List<OrderItem> orderItemList;
    //时间下限
    private String lowerTime;
    //时间上限
    private String upperTime;
    //0 已付款待发货 1已下单待付款 2订单关闭 3已发货 4已收货  5已完成  6已取消
    public static final String SENDGOODS = "0";
    public static final String WAITPAYMENT = "1";
    public static final String ORDERCLOSE = "2";
    public static final String SENDED = "3";
    public static final String DEVERY = "4";
    public static final String FINISHED = "5";
    public static final String CANCEL = "6";

    // 0 余额付款 1 支付宝 2货到付款
    public static final String ALIPAY = "1";
    public static final String HDFK = "2";
    public static final String YFK = "0";

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }


    public String getLowerTime() {
        return lowerTime;
    }

    public void setLowerTime(String lowerTime) {
        this.lowerTime = lowerTime;
    }

    public String getUpperTime() {
        return upperTime;
    }

    public void setUpperTime(String upperTime) {
        this.upperTime = upperTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", no='" + no + '\'' +
                ", userid=" + userid +
                ", ordertime='" + ordertime + '\'' +
                ", paytype='" + paytype + '\'' +
                ", paytime='" + paytime + '\'' +
                ", receivetime='" + receivetime + '\'' +
                ", totalmoney=" + totalmoney +
                ", address='" + address + '\'' +
                ", accept='" + accept + '\'' +
                ", telephone='" + telephone + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public String getReceivetime() {
        return receivetime;
    }

    public void setReceivetime(String receivetime) {
        this.receivetime = receivetime;
    }

    public BigDecimal getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(BigDecimal totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAccept() {
        return accept;
    }

    public void setAccept(String accept) {
        this.accept = accept;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Order(Integer id, String no, Integer userid, String ordertime, String paytype, String paytime, String receivetime, BigDecimal totalmoney, String address, String accept, String telephone, String status) {
        this.id = id;
        this.no = no;
        this.userid = userid;
        this.ordertime = ordertime;
        this.paytype = paytype;
        this.paytime = paytime;
        this.receivetime = receivetime;
        this.totalmoney = totalmoney;
        this.address = address;
        this.accept = accept;
        this.telephone = telephone;
        this.status = status;
    }

    public Order() {
    }
}
