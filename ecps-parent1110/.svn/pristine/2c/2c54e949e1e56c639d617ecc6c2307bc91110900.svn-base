package com.sihai.ecps.dao;

import com.sihai.ecps.model.EbOrder;


public interface EbOrderDao {
	
	/**
	 * 保存订单
	 * @param order 订单实体
	 */
	public void saveOrder(EbOrder order);
	
	/**
	 * 动态更改订单
	 * @param order 订单实体
	 */
	public void updateOrder(EbOrder order);
	
	/**
	 * 根据订单id查询订单
	 * @param businessKey 订单id
	 * @return
	 */
	public EbOrder selectOrderById(String businessKey);
	
	/**
	 * 根据订单id查询订单和订单详情
	 * @param orderId 订单id
	 * @return
	 */
	public EbOrder selectOrderAndDetailById(Long orderId);
}
