package com.sihai.ecps.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.dao.EbFeatureDao;
import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbFeature;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.QueryCondition;

@Repository
public class EbFeatureDaoImpl extends SqlSessionDaoSupport implements EbFeatureDao {

	String ns = "com.sihai.ecps.sqlMap.EbFeatureMapper.";

	public List<EbFeature> selectCommFeature() {
		return this.getSqlSession().selectList(ns+"selectCommFeature");
	}

	public List<EbFeature> selectSpecFeature() {
		return this.getSqlSession().selectList(ns+"selectSpecFeature");
	}

	public List<EbFeature> selectIsSelFeature() {
		return this.getSqlSession().selectList(ns+"selectIsSelFeature");
	}


}
