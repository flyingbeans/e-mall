package com.sihai.ecps.service;

import java.util.List;

import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbItemClob;
import com.sihai.ecps.model.EbParaValue;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.QueryCondition;
import com.sihai.ecps.utils.Page;

public interface EbItemService {

	/**
	 * 根据条件查询商品,返回page对象(对象里包括分页的信息和商品信息)
	 * @param qc 查询条件
	 * @return
	 */
	public Page selectItemByCondition(QueryCondition qc);
	
	/**
	 * 保存商品
	 * @param item 商品实体
	 * @param itemClob 商品大字段
	 * @param paraList 商品普通属性集合
	 * @param skuList 商品的最小销售单元
	 */
	public void saveItem(EbItem item, EbItemClob itemClob, List<EbParaValue> paraList, List<EbSku> skuList);
	
	/**
	 * 商品审核
	 * @param itemId 商品id
	 * @param notes 审核日志
	 * @param auditStatus 审核状态
	 */
	public void auditItem(Long itemId, String notes, Short auditStatus);
	
	/**
	 * 上架商品
	 * @param itemId 商品id
	 * @param showStatus 上架状态
	 */
	public void showItem(Long itemId, short showStatus);
	
	/**
	 * 前台商品查询
	 * @param skuPrice 商品价格
	 * @param brandId 品牌id
	 * @param paraStr 高级属性字符串
	 * @return
	 */
	public List<EbItem> listItem(String skuPrice, Long brandId, String paraStr);
	
	/**
	 * 根据商品id查询商品详细信息
	 * @param itemId 商品id
	 * @return
	 */
	public EbItem selectItemDetailById(Long itemId);
	
	/**
	 * 根据主键查询最小销售单元
	 * @param skuId id
	 * @return
	 */
	public EbSku selectByPrimaryKey(Long skuId);
	
	public String publishItem(Long itemId, String password);
}
