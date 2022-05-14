package com.woniu.mall.entity;

import java.math.BigDecimal;

public class Goods {
    private Integer id;
    private String name;
    private String no;
    private Integer categoryid;
    private Integer stock;
    private String author;
    private String publisher;
    private String publishtime;
    private BigDecimal marketprice;
    private BigDecimal saleprice;
    private String isnew;
    private String ishot;
    private String description;
    private String image;
    private String uptime;
    private String downtime;
    private Integer salenum;
    private Integer remarknum;
    private BigDecimal remarkscore;
    private String status;
    //private Category category;
    private String cname;//类别名称，和xml中的别名一致


    public static final String NORMAL = "0";
    public static final String DISABLED = "1";


    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", no='" + no + '\'' +
                ", categoryid=" + categoryid +
                ", stock=" + stock +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", publishtime='" + publishtime + '\'' +
                ", marketprice=" + marketprice +
                ", saleprice=" + saleprice +
                ", isnew='" + isnew + '\'' +
                ", ishot='" + ishot + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", uptime='" + uptime + '\'' +
                ", downtime='" + downtime + '\'' +
                ", salenum=" + salenum +
                ", remarknum=" + remarknum +
                ", remarkscore=" + remarkscore +
                ", status='" + status + '\'' +
                ", cname='" + cname + '\'' +
                '}';
    }

    public Goods(Integer id, String name, String no, Integer categoryid, Integer stock, String author, String publisher, String publishtime, BigDecimal marketprice, BigDecimal saleprice, String isnew, String ishot, String description, String image, String uptime, String downtime, Integer salenum, Integer remarknum, BigDecimal remarkscore, String status, String cname) {
        this.id = id;
        this.name = name;
        this.no = no;
        this.categoryid = categoryid;
        this.stock = stock;
        this.author = author;
        this.publisher = publisher;
        this.publishtime = publishtime;
        this.marketprice = marketprice;
        this.saleprice = saleprice;
        this.isnew = isnew;
        this.ishot = ishot;
        this.description = description;
        this.image = image;
        this.uptime = uptime;
        this.downtime = downtime;
        this.salenum = salenum;
        this.remarknum = remarknum;
        this.remarkscore = remarkscore;
        this.status = status;
        this.cname = cname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Goods() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public BigDecimal getMarketprice() {
        return marketprice;
    }

    public void setMarketprice(BigDecimal marketprice) {
        this.marketprice = marketprice;
    }

    public BigDecimal getSaleprice() {
        return saleprice;
    }

    public void setSaleprice(BigDecimal saleprice) {
        this.saleprice = saleprice;
    }

    public String getIsnew() {
        return isnew;
    }

    public void setIsnew(String isnew) {
        this.isnew = isnew;
    }

    public String getIshot() {
        return ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getDowntime() {
        return downtime;
    }

    public void setDowntime(String downtime) {
        this.downtime = downtime;
    }

    public Integer getSalenum() {
        return salenum;
    }

    public void setSalenum(Integer salenum) {
        this.salenum = salenum;
    }

    public Integer getRemarknum() {
        return remarknum;
    }

    public void setRemarknum(Integer remarknum) {
        this.remarknum = remarknum;
    }

    public BigDecimal getRemarkscore() {
        return remarkscore;
    }

    public void setRemarkscore(BigDecimal remarkscore) {
        this.remarkscore = remarkscore;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
