package com.sihai.ecps.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sihai.ecps.dao.EbConsoleLogDao;
import com.sihai.ecps.model.EbConsoleLog;

@Repository
public class EbConsoleLogDaoImpl extends SqlSessionDaoSupport implements EbConsoleLogDao {

	String ns = "com.sihai.ecps.sqlMap.EbConsoleLogMapper.";

	public void saveConsoleLog(EbConsoleLog consoleLog) {
		this.getSqlSession().insert(ns+"insert", consoleLog);
	}


}
