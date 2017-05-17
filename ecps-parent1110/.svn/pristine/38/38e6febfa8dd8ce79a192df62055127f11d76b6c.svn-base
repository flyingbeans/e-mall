package com.sihai.ecps.dao;

import java.util.List;
import java.util.Map;

import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.QueryCondition;


public interface EbSkuDao {
	
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
	
	public int updateStock(Map<String,Object> map);
}
