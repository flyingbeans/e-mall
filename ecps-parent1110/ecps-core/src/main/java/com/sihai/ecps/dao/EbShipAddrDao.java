package com.sihai.ecps.dao;

import java.util.List;

import com.sihai.ecps.model.EbShipAddr;

public interface EbShipAddrDao {
	
	/**
	 * 查询用户的所有收货地址
	 * @return 收货地址集合
	 */
	public List<EbShipAddr> selectAddr();
	
	/**
	 * 根据id查询收货地址
	 * @param shipAddrId 收货地址id
	 * @return
	 */
	public EbShipAddr selectAddrByShipAddrId(Long shipAddrId);
	
	/**
	 * 动态添加收货地址
	 * @param shipAddr 收货地址实体
	 */
	public void insertSelective(EbShipAddr shipAddr);
	
	/**
	 * 动态更新收货地址
	 * @param shipAddr 收货地址实体
	 */
	public void updateByPrimaryKeySelective(EbShipAddr shipAddr);
	
	/**
	 * 根据收货地址id修改收货地址为默认地址
	 * @param shipAddrId 收货地址id
	 */
	public void updateShipAddrDefault(Long shipAddrId);
	
	public List<EbShipAddr> selectAddrByUserId(Long ptlUserId);
	
	public void destoryDefault(Long ptlUserId);
}
