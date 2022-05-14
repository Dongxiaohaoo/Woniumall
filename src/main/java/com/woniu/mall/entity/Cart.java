package com.woniu.mall.entity;

import java.math.BigDecimal;

public class Cart {
    private Integer id;
    private Integer userid;
    private Integer goodsid;
    private Integer num;
    private BigDecimal addprice;
    private String addtime;
    private String ischecked;
    private Goods goods;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    //0代表选中 1代表未选中
    public static final String CHECKED = "0";
    public static final String UNCHECKED = "1";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
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

    public BigDecimal getAddprice() {
        return addprice;
    }

    public void setAddprice(BigDecimal addprice) {
        this.addprice = addprice;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getIschecked() {
        return ischecked;
    }

    public void setIschecked(String ischecked) {
        this.ischecked = ischecked;
    }

    public Cart() {
    }

    public Cart(Integer id, Integer userid, Integer goodsid, Integer num, BigDecimal addprice, String addtime, String ischecked) {
        this.id = id;
        this.userid = userid;
        this.goodsid = goodsid;
        this.num = num;
        this.addprice = addprice;
        this.addtime = addtime;
        this.ischecked = ischecked;
    }
}
