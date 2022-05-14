package com.woniu.mall.entity;

public class OrderItem {
    private Integer id;
    private Integer orderid;
    private Integer goodsid;
    private Integer num;
    private String price;
    private Goods goods;
    private Order order;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderid=" + orderid +
                ", goodsid=" + goodsid +
                ", num=" + num +
                ", price='" + price + '\'' +
                '}';
    }

    public OrderItem() {
    }

    public OrderItem(Integer id, Integer orderid, Integer goodsid, Integer num, String price) {
        this.id = id;
        this.orderid = orderid;
        this.goodsid = goodsid;
        this.num = num;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
