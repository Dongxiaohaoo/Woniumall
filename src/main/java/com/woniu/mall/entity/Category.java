package com.woniu.mall.entity;

public class Category {
    private Integer id;
    private String name;
    private String status;
    public static final String NOMARL = "0";
    public static final String DISABLED = "1";

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status='" + status + '\'' +
                '}';
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Category(Integer id, String name, String status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Category() {
    }
}
