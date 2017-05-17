package com.sihai.ecps.ws.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbItemDao;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.utils.ECPSUtils;
import com.sihai.ecps.utils.FMutil;
import com.sihai.ecps.ws.service.EbWsItemService;

@Service
public class EbWsItemServiceImpl implements EbWsItemService{
	
	@Autowired
	private EbItemDao itemDao;
	
	public String publishItem(Long itemId, String password) throws Exception{
		String pass = ECPSUtils.readProp("pass_code");
		if(StringUtils.equals(password, pass)){
			EbItem item  = itemDao.selectItemDetailById(itemId);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("item", item);
			FMutil fm = new FMutil();
			fm.ouputFile("productDetail.ftl", item.getItemId()+".html", map);
			return "success";		
		} else {
			return "error";
		}
	}
}
