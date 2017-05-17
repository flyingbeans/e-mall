package com.sihai.ecps.ws.service;

import javax.jws.WebService;

@WebService
public interface EbWsItemService {
	/**
	 * 发布商品
	 * @param itemId 商品id
	 * @param password 密钥
	 * @return
	 */
	public String publishItem(Long itemId, String password) throws Exception;
}
