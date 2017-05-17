package com.sihai.ecps.service;

import java.util.List;

import com.sihai.ecps.model.EbSku;

public interface EbSkuService {
	
	/**
	 * 保存商品最小单元 
	 */
	public void saveSku(List<EbSku> skuList, Long itemId);
	
	/**
	 * 根据主键查询最小销售单元
	 * @param skuId id
	 * @return
	 */
	public EbSku selectByPrimaryKey(Long skuId);
	
	/**
	 * 根据skuid获取最小销售单元.商品和商品规格
	 * @param skuId 最小销售单元id
	 * @return
	 */
	public EbSku getSkuDetailById(Long skuId);
}
