package com.sihai.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbShipAddrDao;
import com.sihai.ecps.model.EbShipAddr;

@Repository
public class EbShipAddrDaoImpl extends SqlSessionDaoSupport implements EbShipAddrDao {

	String ns = "com.sihai.ecps.sqlMap.EbShipAddrMapper.";

	public List<EbShipAddr> selectAddr() {
		return this.getSqlSession().selectList(ns+"selectAddr");
	}

	public EbShipAddr selectAddrByShipAddrId(Long shipAddrId) {
		return this.getSqlSession().selectOne(ns+"selectAddrByShipAddrId", shipAddrId);
	}

	public void insertSelective(EbShipAddr shipAddr) {
		this.getSqlSession().insert(ns+"insert", shipAddr);
	}

	public void updateByPrimaryKeySelective(EbShipAddr shipAddr) {
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", shipAddr);
	}

	public void updateShipAddrDefault(Long shipAddrId) {
		this.getSqlSession().update(ns+"updateShipAddrDefault", shipAddrId);
	}

	public List<EbShipAddr> selectAddrByUserId(Long ptlUserId) {
		return this.getSqlSession().selectList(ns+"selectAddrByUserId", ptlUserId);
	}

	public void destoryDefault(Long ptlUserId) {
		this.getSqlSession().update(ns+"destoryDefault", ptlUserId);
	}

}
