package com.sihai.ecps.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbShipAddrDao;
import com.sihai.ecps.dao.TsPtlUserDao;
import com.sihai.ecps.model.EbShipAddr;
import com.sihai.ecps.model.TsPtlUser;
import com.sihai.ecps.service.TsPtlUserService;

@Service
public class TsPtlUserServiceImpl implements TsPtlUserService {
	
	@Autowired
	private TsPtlUserDao userDao;
	@Autowired
	private EbShipAddrDao shipAddrDao;
	
	public TsPtlUser selectUserByUsernameAndPwd(Map<String, String> map) {
		return userDao.selectUserByUsernameAndPwd(map);
	}

	public List<EbShipAddr> selectAddr() {
		return shipAddrDao.selectAddr();
	}

	public EbShipAddr selectAddrByShipAddrId(Long shipAddrId) {
		return shipAddrDao.selectAddrByShipAddrId(shipAddrId);
	}

	public void insertShipAddr(EbShipAddr shipAddr, Long userId) {
		shipAddr.setPtlUserId(userId);
		shipAddrDao.insertSelective(shipAddr);
	}

	public void updateShipAddr(EbShipAddr shipAddr, Long userId) {
		shipAddr.setPtlUserId(userId);
		shipAddrDao.updateByPrimaryKeySelective(shipAddr);
	}

	public void updateShipAddrDefault(Long shipAddrId) {
		shipAddrDao.updateShipAddrDefault(shipAddrId);
	}


}
