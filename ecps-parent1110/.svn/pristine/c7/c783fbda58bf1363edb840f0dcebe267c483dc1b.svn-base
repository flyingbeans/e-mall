package com.sihai.ecps.service;

import java.util.List;
import java.util.Map;

import com.sihai.ecps.model.EbShipAddr;
import com.sihai.ecps.model.TsPtlUser;

public interface TsPtlUserService {
	
	/**
	 * 根据用户名和密码查询用户
	 * @param map 用户名和密码map集合
	 * @return
	 */
	public TsPtlUser selectUserByUsernameAndPwd(Map<String, String> map);
	
	/**
	 * 查询用户的收货地址
	 * @return 收货地址集合
	 */
	public List<EbShipAddr> selectAddr();
	
	/**
	 * 根据id查询用户收货地址
	 * @param shipAddrId 用户收货地址id
	 * @return
	 */
	public EbShipAddr selectAddrByShipAddrId(Long shipAddrId);
	
	/**
	 * 动态添加收货地址
	 * @param shipAddr 收货地址实体
	 * @param long1 
	 */
	public void insertShipAddr(EbShipAddr shipAddr, Long userId);
	
	/**
	 * 修改收货地址
	 * @param shipAddr 收货地址实体
	 */
	public void updateShipAddr(EbShipAddr shipAddr, Long userId);

	/**
	 * 根据id修改收货地址为默认地址
	 * @param shipAddrId 收货地址id
	 */
	public void updateShipAddrDefault(Long shipAddrId);
}
