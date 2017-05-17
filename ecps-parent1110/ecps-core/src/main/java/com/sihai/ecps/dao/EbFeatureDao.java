package com.sihai.ecps.dao;

import java.util.List;

import com.sihai.ecps.model.EbFeature;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.QueryCondition;


public interface EbFeatureDao {
	
	/**
	 * 查询商品普通属性
	 * @return
	 */
	public List<EbFeature> selectCommFeature();
	
	/**
	 * 查询商品特殊属性
	 * @return
	 */
	public List<EbFeature> selectSpecFeature();
	
	/**
	 * 查询商品是否被选中的属性
	 * @return
	 */
	public List<EbFeature> selectIsSelFeature();
}
