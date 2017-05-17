package com.sihai.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbOrderDetailDao;
import com.sihai.ecps.model.EbOrderDetail;

@Repository
public class EbOrderDetailDaoImpl extends SqlSessionDaoSupport implements EbOrderDetailDao {

	String ns = "com.sihai.ecps.sqlMap.EbOrderDetailMapper.";

	public void saveOrderDetail(EbOrderDetail orderDetail) {
		this.getSqlSession().insert(ns+"insert", orderDetail);
	}


}
