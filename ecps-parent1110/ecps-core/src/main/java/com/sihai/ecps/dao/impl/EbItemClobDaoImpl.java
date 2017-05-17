package com.sihai.ecps.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.dao.EbItemClobDao;
import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbItemClob;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.model.QueryCondition;

@Repository
public class EbItemClobDaoImpl extends SqlSessionDaoSupport implements EbItemClobDao {

	String ns = "com.sihai.ecps.sqlMap.EbItemClobMapper.";

	public void saveItemClob(EbItemClob itemClob, Long itemId) {
		itemClob.setItemId(itemId);
		this.getSqlSession().insert(ns+"insert", itemClob);
	}

}
