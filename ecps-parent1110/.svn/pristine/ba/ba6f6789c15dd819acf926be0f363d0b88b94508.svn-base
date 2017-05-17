package com.sihai.ecps.dao.impl;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.TsPtlUserDao;
import com.sihai.ecps.model.TsPtlUser;

@Repository
public class TsPtlUserDaoImpl extends SqlSessionDaoSupport implements TsPtlUserDao {

	String ns = "com.sihai.ecps.sqlMap.TsPtlUserMapper.";

	public TsPtlUser selectUserByUsernameAndPwd(Map<String, String> map) {
		return this.getSqlSession().selectOne(ns+"selectUserByUsernameAndPwd", map);
	}
}
