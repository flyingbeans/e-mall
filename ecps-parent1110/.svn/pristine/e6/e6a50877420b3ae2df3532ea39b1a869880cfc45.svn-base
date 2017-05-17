package com.sihai.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.dao.EbParaValueDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbParaValue;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.model.QueryCondition;

@Repository
public class EbParaValueDaoImpl extends SqlSessionDaoSupport implements EbParaValueDao {

	String ns = "com.sihai.ecps.sqlMap.EbParaValueMapper.";

	public void saveParaValue(List<EbParaValue> paraList, Long itemId) {
		SqlSession session = this.getSqlSession();
		for (EbParaValue ebParaValue : paraList) {
			ebParaValue.setItemId(itemId);
			session.insert(ns+"insert", ebParaValue);
		}
	}

}
