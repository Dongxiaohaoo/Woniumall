package com.woniu.mall.entity.address;

import java.util.List;

public class Province {
    private String code;
    private String content;
    private String code_level;
    private String superior;

    @Override
    public String toString() {
        return "Province{" +
                "code='" + code + '\'' +
                ", content='" + content + '\'' +
                ", code_level='" + code_level + '\'' +
                ", superior='" + superior + '\'' +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode_level() {
        return code_level;
    }

    public void setCode_level(String code_level) {
        this.code_level = code_level;
    }

    public String getSuperior() {
        return superior;
    }

    public void setSuperior(String superior) {
        this.superior = superior;
    }

    public Province() {
    }

    public Province(String code, String content, String code_level, String superior) {
        this.code = code;
        this.content = content;
        this.code_level = code_level;
        this.superior = superior;
    }
}
