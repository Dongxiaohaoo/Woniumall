package com.woniu.mall.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class DateUtil {
    /**
     * 获取字符串日期yMd hms
     * @return
     */
    public static String getDate(){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(date);
        return format;
    }

    /**
     * string数组转int数组
     * @param strings
     * @return
     */
    public static Integer[] StringToInt(String[] strings){
        Integer[] integers = new Integer[strings.length];
        for (int i = 0; i < integers.length; i++) {
            integers[i] = Integer.parseInt(strings[i]);
        }
        return integers;
    }

    /**
     * 随机生成商品编号
     * @return
     */
    public static String getGoodsNo(){
        String s = "WNBK"+System.currentTimeMillis()+(int)(Math.random()*1000000);
        return s;
    }

    /**
     * 随机生成
     * @return
     */
    public static String orderId(){
        String s = "WN"+System.currentTimeMillis()+(int)(Math.random()*1000000);
        return s;
    }

    /**
     * 生成token
     */
    public static String getToken(){
        String s = UUID.randomUUID().toString();
        String s1 = s.replaceAll("-", "");
        return s1;
    }
}
