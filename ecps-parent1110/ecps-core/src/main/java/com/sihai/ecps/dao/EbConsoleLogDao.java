package com.sihai.ecps.dao;

import com.sihai.ecps.model.EbConsoleLog;


public interface EbConsoleLogDao {
	/**
	 * 保存后台日志
	 * @param consoleLog 日志实体
	 */
	public void saveConsoleLog(EbConsoleLog consoleLog);
}
