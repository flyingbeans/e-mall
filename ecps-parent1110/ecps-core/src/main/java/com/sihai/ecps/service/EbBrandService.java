package com.sihai.ecps.service;

import java.util.List;

import com.sihai.ecps.model.EbBrand;

public interface EbBrandService {

	public void saveBrand(EbBrand brand);

	public void deleteBrand(Long brandId);

	public EbBrand getBrandById(Long brandId);

	public void updateBrand(EbBrand brand);

	public List<EbBrand> selectBrand();

	public List<EbBrand> selectBrandByName(String brandName);
}
