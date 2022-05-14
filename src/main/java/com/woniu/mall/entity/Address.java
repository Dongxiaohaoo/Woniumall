package com.woniu.mall.entity;


public class Address {

  private Integer id;
  private Integer userid;
  private String accept;
  private String telephone;
  private String province;
  private String city;
  private String area;
  private String street;
  private String isdefault;

  @Override
  public String toString() {
    return "Address{" +
            "id=" + id +
            ", userid=" + userid +
            ", accept='" + accept + '\'' +
            ", telephone='" + telephone + '\'' +
            ", province='" + province + '\'' +
            ", city='" + city + '\'' +
            ", area='" + area + '\'' +
            ", street='" + street + '\'' +
            ", isdefault='" + isdefault + '\'' +
            '}';
  }

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

  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getArea() {
    return area;
  }

  public void setArea(String area) {
    this.area = area;
  }

  public String getStreet() {
    return street;
  }

  public void setStreet(String street) {
    this.street = street;
  }

  public String getIsdefault() {
    return isdefault;
  }

  public void setIsdefault(String isdefault) {
    this.isdefault = isdefault;
  }

  public Address(Integer id, Integer userid, String accept, String telephone, String province, String city, String area, String street, String isdefault) {
    this.id = id;
    this.userid = userid;
    this.accept = accept;
    this.telephone = telephone;
    this.province = province;
    this.city = city;
    this.area = area;
    this.street = street;
    this.isdefault = isdefault;
  }

  public Address() {
  }
}
