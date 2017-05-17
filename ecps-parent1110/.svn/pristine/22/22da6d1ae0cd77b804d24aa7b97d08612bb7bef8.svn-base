package com.sihai.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sihai.ecps.model.EbCart;

public interface EbCartService {
	
	/**
	 * 查询购物车所有商品
	 * @param request 
	 * @param response
	 * @return
	 */
	public List<EbCart> listCart(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 添加购物车
	 * @param request
	 * @param response
	 * @param skuId 最小销售单元id
	 * @param quantity 商品数量
	 */
	public void addCart(HttpServletRequest request, HttpServletResponse response, Long skuId, Integer quantity);
	
	/**
	 * 根据商品id商品数量加一
	 * @param request
	 * @param response
	 * @param skuId 最小销售单元id
	 */
	public void addNum(HttpServletRequest request, HttpServletResponse response, Long skuId);
	
	/**
	 * 根据商品id商品数量减一
	 * @param request
	 * @param response
	 * @param skuId 最小销售单元id
	 */
	public void reduceNum(HttpServletRequest request, HttpServletResponse response, Long skuId);
	
	public void deleteCart(HttpServletRequest request, HttpServletResponse response, Long skuId);
	
	public void clearCart(HttpServletRequest request, HttpServletResponse response);
	
	public String validCookie(HttpServletRequest request, HttpServletResponse response);
	
	public String validCar(HttpServletRequest request, HttpServletResponse response);
}
