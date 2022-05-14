package com.woniu.mall.service;

import com.woniu.mall.dao.AddressDao;
import com.woniu.mall.entity.Address;
import com.woniu.mall.entity.User;
import com.woniu.mall.util.MybatisUtil;

import java.util.List;

public class AddressService {

    /**
     * 查询某个用户所有地址
     * @param user
     * @return
     */
    public List<Address> getUserAddress(User user){
        AddressDao mapper = MybatisUtil.getConn().getMapper(AddressDao.class);
        Integer id = user.getId();
        List<Address> allAddress = mapper.getAllAddress(id);
        return allAddress;
    }

    public Address getAddressByUserIdAndAddressId(Integer id, String addressId) {
        AddressDao mapper = MybatisUtil.getConn().getMapper(AddressDao.class);
        Address address = mapper.getAddressByUserIdAndAddressId(id,addressId);
        return address;
    }

    public void delByid(String id) {
        AddressDao mapper = MybatisUtil.getConn().getMapper(AddressDao.class);
        mapper.delByid(id);
    }

    public void defaultAddress(String addressId,User user) {
        AddressDao mapper = MybatisUtil.getConn().getMapper(AddressDao.class);
        //首先取消用户所有状态
        mapper.setAllNoDefaule(String.valueOf(user.getId()));
        //设置一个新的为默认选中
        mapper.defaultAddress(addressId);
    }

    public void addAddress(Address address,String userId) {
        AddressDao mapper = MybatisUtil.getConn().getMapper(AddressDao.class);
        String isdefault = address.getIsdefault();
        if (isdefault.equals("Y")){
            mapper.setAllNoDefaule(userId);
        }
        mapper.addAddress(address);
    }
}
