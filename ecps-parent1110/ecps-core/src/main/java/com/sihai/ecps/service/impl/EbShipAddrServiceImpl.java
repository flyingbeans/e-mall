package com.sihai.ecps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbShipAddrDao;
import com.sihai.ecps.model.EbShipAddr;
import com.sihai.ecps.service.EbShipAddrService;

@Service
public class EbShipAddrServiceImpl implements EbShipAddrService {
	
	@Autowired
	private EbShipAddrDao shipAddrDao;
	
	public List<EbShipAddr> selectAddr() {
		return shipAddrDao.selectAddr();
	}

	public EbShipAddr selectAddrByShipAddrId(Long shipAddrId) {
		return shipAddrDao.selectAddrByShipAddrId(shipAddrId);
	}

	public void insertSelective(EbShipAddr shipAddr) {
		shipAddrDao.insertSelective(shipAddr);
	}

	public void updateByPrimaryKeySelective(EbShipAddr shipAddr) {
		shipAddrDao.updateByPrimaryKeySelective(shipAddr);
	}

	public void updateShipAddrDefault(Long shipAddrId) {
		shipAddrDao.updateShipAddrDefault(shipAddrId);
	}

	public List<EbShipAddr> selectAddrByUserId(Long ptlUserId) {
		return shipAddrDao.selectAddrByUserId(ptlUserId);
	}

	public void destoryDefault(Long ptlUserId) {
		shipAddrDao.destoryDefault(ptlUserId);
	}
	

}
