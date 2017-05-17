package com.sihai.ecps.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbConsoleLogDao;
import com.sihai.ecps.dao.EbItemClobDao;
import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.dao.EbParaValueDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbConsoleLog;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbItemClob;
import com.sihai.ecps.model.EbParaValue;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.QueryCondition;
import com.sihai.ecps.service.EbItemService;
import com.sihai.ecps.stub.EbWsItemService;
import com.sihai.ecps.stub.EbWsItemServiceService;
import com.sihai.ecps.utils.Page;

@Service
public class EbItemServiceImpl implements EbItemService {

	@Autowired
	private EbItemDao itemDao;
	@Autowired
	private EbItemClobDao itemClobDao;
	@Autowired
	private EbParaValueDao paraValueDao;
	@Autowired
	private EbSkuDao skuDao;
	@Autowired
	private EbConsoleLogDao consoleLogDao;

	public Page selectItemByCondition(QueryCondition qc) {
		// 查询当前条件下的总记录数
		Integer totalCount = itemDao.selectItemByConditionCount(qc);
		// 创建分页的page对象
		Page page = new Page();
		page.setPageNo(qc.getPageNo());
		page.setTotalCount(totalCount);
		// 获得开始行号和结束行号
		Integer startNum = page.getStartNum();
		Integer endNum = page.getEndNum();
		qc.setStartNum(startNum);
		qc.setEndNum(endNum);
		List<EbItem> itemList = itemDao.selectItemByCondition(qc);
		page.setList(itemList);
		return page;
	}

	public void saveItem(EbItem item, EbItemClob itemClob,
			List<EbParaValue> paraList, List<EbSku> skuList) {
		itemDao.saveItem(item);
		paraValueDao.saveParaValue(paraList, item.getItemId());
		itemClobDao.saveItemClob(itemClob, item.getItemId());
		skuDao.saveSku(skuList, item.getItemId());
	}

	public void auditItem(Long itemId, String notes, Short auditStatus) {
		//创建商品，更新商品信息
		EbItem item = new EbItem();
		item.setAuditStatus(auditStatus);
		item.setCheckerUserId((long) 11);
		item.setCheckTime(new Date());
		item.setItemId(itemId);
		itemDao.updateItem(item);
		//创建后台日志实体
		EbConsoleLog consoleLog = new EbConsoleLog();
		consoleLog.setEntityId(itemId);
		consoleLog.setEntityName("商品表");
		consoleLog.setNotes(notes);
		consoleLog.setOpTime(new Date());
		if(auditStatus == 1){
			consoleLog.setOpType("审核通过");
		} else {
			consoleLog.setOpType("审核不通过");
		}
		consoleLog.setTableName("EB_ITEM");
		consoleLog.setUserId((long) 11);
		consoleLogDao.saveConsoleLog(consoleLog);
	}

	public void showItem(Long itemId, short showStatus) {
		EbItem item = new EbItem();
		item.setShowStatus(showStatus);
		item.setUpdateTime(new Date());
		item.setUpdateUserId((long) 11);
		itemDao.updateItem(item);
		//创建后台日志实体
		EbConsoleLog consoleLog = new EbConsoleLog();
		consoleLog.setEntityId(itemId);
		consoleLog.setEntityName("商品表");
		consoleLog.setOpTime(new Date());
		consoleLog.setOpType("商品上架");
		consoleLog.setTableName("EB_ITEM");
		consoleLog.setUserId((long) 11);
		consoleLogDao.saveConsoleLog(consoleLog);
	}

	public List<EbItem> listItem(String skuPrice, Long brandId, String paraStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(skuPrice) && !StringUtils.equals(skuPrice, "")){
			String[] skuStr = skuPrice.split("-");
			map.put("maxPrice", skuStr[1]);
			map.put("minPrice", skuStr[0]);
		}
		
		map.put("brandId", brandId);
		
		if(StringUtils.isNotBlank(paraStr) && !StringUtils.equals(paraStr, "")){
			String[] paraList = skuPrice.split(",");
			map.put("paraList", paraList);
		}
		
		return itemDao.listItem(map);
	}

	public EbItem selectItemDetailById(Long itemId) {
		return itemDao.selectItemDetailById(itemId);
	}

	public EbSku selectByPrimaryKey(Long skuId) {
		return skuDao.selectByPrimaryKey(skuId);
	}

	public String publishItem(Long itemId, String password) {
		//创建服务访问点集合的对象
		EbWsItemServiceService wsItemServiceService = new EbWsItemServiceService();
		//获得服务访问点绑定的服务类，使用服务访问点的name的值前面get方法 getEbWSItemServicePort
		EbWsItemService service = wsItemServiceService.getEbWsItemServicePort();
		
		return service.publishItem(itemId, password);
	}

}
