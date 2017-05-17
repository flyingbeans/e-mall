package com.sihai.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbFeatureDao;
import com.sihai.ecps.model.EbFeature;
import com.sihai.ecps.service.EbFeatureService;

@Service
public class EbFeatureServiceImpl implements EbFeatureService {
	
	@Autowired
	private EbFeatureDao featureDao;

	public List<EbFeature> selectCommFeature() {
		return featureDao.selectCommFeature();
	}

	public List<EbFeature> selectSpecFeature() {
		return featureDao.selectSpecFeature();
	}

	public List<EbFeature> selectIsSelFeature() {
		return featureDao.selectIsSelFeature();
	}


}
