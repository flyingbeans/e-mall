package com.sihai.ecps.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.QueryCondition;

@Repository
public class EbItemDaoImpl extends SqlSessionDaoSupport implements EbItemDao {

	String ns = "com.sihai.ecps.sqlMap.EbItemMapper.";

	public List<EbItem> selectItemByCondition(QueryCondition qc) {
		return this.getSqlSession().selectList(ns + "selectItemByCondition", qc);
	}

	public int selectItemByConditionCount(QueryCondition qc) {
		return this.getSqlSession().selectOne(ns + "selectItemByConditionCount", qc);
	}

	public void saveItem(EbItem item) {
		this.getSqlSession().insert(ns+"insert", item);
	}

	public void updateItem(EbItem item) {
		this.getSqlSession().update(ns+"updateByPrimaryKeySelective", item);
	}

	public List<EbItem> listItem(Map<String, Object> map) {
		return this.getSqlSession().selectList(ns+"listItem", map);
	}

	public EbItem selectItemDetailById(Long itemId) {
		return this.getSqlSession().selectOne(ns+"selectItemDetailById", itemId);
	}

}
