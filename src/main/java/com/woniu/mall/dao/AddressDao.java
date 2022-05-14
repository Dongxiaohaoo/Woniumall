package com.woniu.mall.dao;

import com.woniu.mall.entity.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressDao {

    //查询某个用户的所有地址
    List<Address> getAllAddress(Integer id);

    //查询某个用户选的那条地址
    Address getAddressByUserIdAndAddressId(@Param("id") Integer id,@Param("addressId") String addressId);

    void delByid(String id);

    void defaultAddress(String id);

    //传一个UserId
    void setAllNoDefaule(String id);

    void addAddress(Address address);
}
