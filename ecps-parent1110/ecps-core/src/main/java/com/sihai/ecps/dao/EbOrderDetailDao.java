package com.sihai.ecps.dao;

import com.sihai.ecps.model.EbOrderDetail;


public interface EbOrderDetailDao {
	
	/**
	 * 保存订单明细
	 * @param orderDetail 订单明细实体
	 */
	public void saveOrderDetail(EbOrderDetail orderDetail);
}
