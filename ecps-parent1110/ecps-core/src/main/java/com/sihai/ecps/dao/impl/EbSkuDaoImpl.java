package com.sihai.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.model.QueryCondition;

@Repository
public class EbSkuDaoImpl extends SqlSessionDaoSupport implements EbSkuDao {

	String ns = "com.sihai.ecps.sqlMap.EbSkuMapper.";
	String ns1 = "com.sihai.ecps.sqlMap.EbSpecValueMapper.";

	public void saveSku(List<EbSku> skuList, Long itemId) {
		SqlSession session = this.getSqlSession();
		for (EbSku sku : skuList) {
			//设置最小销售单元的商品外键
			sku.setItemId(itemId);
			session.insert(ns+"insert", sku);
			List<EbSpecValue> specList = sku.getSpecList();
			for (EbSpecValue specValue : specList) {
				//设置特殊属性的最小销售单元外键
				specValue.setSkuId(sku.getSkuId());
				session.insert(ns1+"insert",specValue);
			}
		}
	}

	public EbSku selectByPrimaryKey(Long skuId) {
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey", skuId);
	}

	public EbSku getSkuDetailById(Long skuId) {
		return this.getSqlSession().selectOne(ns+"getSkuDetailById", skuId);
	}
	
	public int updateStock(Map<String, Object> map) {
		return this.getSqlSession().update(ns+"updateStock", map);
	}
}
