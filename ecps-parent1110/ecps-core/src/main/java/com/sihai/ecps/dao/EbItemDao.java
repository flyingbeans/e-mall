package com.sihai.ecps.dao;

import java.util.List;
import java.util.Map;

import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.QueryCondition;


public interface EbItemDao {
	/**
	 * 根据条件查询商品
	 * @param qc 查询条件
	 * @return
	 */
	public List<EbItem> selectItemByCondition(QueryCondition qc);
	
	/**
	 * 根据条件查询商品数量
	 * @param qc 查询条件
	 * @return
	 */
	public int selectItemByConditionCount(QueryCondition qc);
	
	/**
	 * 保存商品
	 * @param item 商品实体
	 */
	public void saveItem(EbItem item);
	
	/**
	 * 更新商品
	 * @param item 商品实体
	 */
	public void updateItem(EbItem item);
	
	/**
	 * 前台查询商品
	 * @param map 查询信息
	 * @return
	 */
	public List<EbItem> listItem(Map<String, Object> map);
	
	/**
	 * 根据商品id查询商品详细信息
	 * @param itemId 商品id
	 * @return
	 */
	public EbItem selectItemDetailById(Long itemId);
}
