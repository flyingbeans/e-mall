package com.sihai.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbBrandDao;
import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.service.EbBrandService;

@Service
public class EbBrandServiceImpl implements EbBrandService {
	
	@Autowired
	private EbBrandDao ebBrandDao;

	public void saveBrand(EbBrand brand) {
		ebBrandDao.saveBrand(brand);
	}

	public void deleteBrand(Long brandId) {
		ebBrandDao.deleteBrand(brandId);
	}

	public EbBrand getBrandById(Long brandId) {
		return ebBrandDao.getBrandById(brandId);
	}

	public void updateBrand(EbBrand brand) {
		ebBrandDao.updateBrand(brand);
	}

	public List<EbBrand> selectBrand() {
		return ebBrandDao.selectBrand();
	}

	public List<EbBrand> selectBrandByName(String brandName) {
		return ebBrandDao.selectBrandByName(brandName);
	}

}
