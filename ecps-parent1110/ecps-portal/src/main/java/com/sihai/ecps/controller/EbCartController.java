package com.sihai.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbCart;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.service.EbCartService;
import com.sihai.ecps.service.EbSkuService;
import com.sihai.ecps.utils.ECPSUtils;

@RequestMapping("cart")
@Controller
public class EbCartController {
	
	@Autowired
	private EbSkuService skuService;
	
	@Autowired
	private EbCartService cartService;
	
	@RequestMapping("/listCart.do")
	public String listCart(HttpServletRequest request, HttpServletResponse response, Model model){
		List<EbCart> cartList = cartService.listCart(request, response);
		Integer itemNum = 0;
		BigDecimal totalPrice = new BigDecimal(0);
		for(EbCart cart : cartList){
			itemNum = itemNum + cart.getQuantity();
			totalPrice = totalPrice.add(cart.getSku().getSkuPrice().multiply(new BigDecimal(cart.getQuantity())));
		}
		model.addAttribute("itemNum", itemNum);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("cartList", cartList);
		return "shop/car";
	}
	
	@RequestMapping("/addCart.do")
	public void addCart(HttpServletRequest request, HttpServletResponse response, 
			Long skuId, Integer quantity, PrintWriter out){
		cartService.addCart(request, response, skuId, quantity);
		out.write("success");
	}
	
	@RequestMapping("/validCookie.do")
	public void validCookie(HttpServletRequest request, HttpServletResponse response){
		String result = cartService.validCookie(request, response);
		ECPSUtils.printJson(result, response);
	}
	
	@RequestMapping("/validStock.do")
	public void validStock(Long skuId, Integer quantity, PrintWriter out){
		EbSku sku = skuService.selectByPrimaryKey(skuId);
		String result = "yes";
		if(sku.getStockInventory() < quantity){
			result = "no";
		}
		out.write(result);
	}
	
	@RequestMapping("/reduceNum.do")
	public String reduceNum(HttpServletRequest request, HttpServletResponse response, 
			Long skuId){
		cartService.reduceNum(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(HttpServletRequest request, HttpServletResponse response, 
			Long skuId){
		cartService.deleteCart(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/addNum.do")
	public String addNum(HttpServletRequest request, HttpServletResponse response, 
			Long skuId){
		cartService.addNum(request, response, skuId);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/clearCart.do")
	public String clearCart(HttpServletRequest request, HttpServletResponse response){
		cartService.clearCart(request, response);
		return "redirect:listCart.do";
	}
	
	@RequestMapping("/validCar.do")
	public void validCar(HttpServletRequest request, HttpServletResponse response){
		String result = cartService.validCar(request, response);
		ECPSUtils.printJson(result, response);
	}
	
	@RequestMapping("/validStockCar.do")
	public void validStockCar(Long skuId, Integer quantity, PrintWriter out){
		EbSku sku = skuService.selectByPrimaryKey(skuId);
		String result = "yes";
		if(sku.getStockInventory() < quantity){
			result = "no";
		}
		JSONObject obj = new JSONObject();
		obj.accumulate("result", result);
		obj.accumulate("stock", sku.getStockInventory());
		result = obj.toString();
		out.write(result);
	}
}
