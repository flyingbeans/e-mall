package com.sihai.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbOrderDao;
import com.sihai.ecps.model.EbOrder;

@Repository
public class EbOrderDaoImpl extends SqlSessionDaoSupport implements EbOrderDao {

	String ns = "com.sihai.ecps.sqlMap.EbOrderMapper.";

	public void saveOrder(EbOrder order) {
		this.getSqlSession().insert(ns+"insert", order);
	}

	public void updateOrder(EbOrder order) {
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", order);
	}

	public EbOrder selectOrderById(String businessKey) {
		return this.getSqlSession().selectOne(ns+"selectByPrimaryKey", businessKey);
	}

	public EbOrder selectOrderAndDetailById(Long orderId) {
		return this.getSqlSession().selectOne(ns+"selectOrderAndDetailById", orderId);
	}

	

}
