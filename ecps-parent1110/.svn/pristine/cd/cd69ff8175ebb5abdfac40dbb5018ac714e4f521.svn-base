package com.sihai.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.service.EbBrandService;
import com.sihai.ecps.service.EbSkuService;

@Service
public class EbSkuServiceImpl implements EbSkuService {

	@Autowired
	private EbSkuDao skuDao;
	
	public void saveSku(List<EbSku> skuList, Long itemId) {
		skuDao.saveSku(skuList, itemId);
	}

	public EbSku selectByPrimaryKey(Long skuId) {
		return skuDao.selectByPrimaryKey(skuId);
	}

	public EbSku getSkuDetailById(Long skuId) {
		return skuDao.getSkuDetailById(skuId);
	}
	

}
