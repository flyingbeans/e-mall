package com.sihai.ecps.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.exception.EbStockException;
import com.sihai.ecps.model.EbCart;
import com.sihai.ecps.model.EbOrder;
import com.sihai.ecps.model.EbOrderDetail;
import com.sihai.ecps.model.EbShipAddr;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.model.TsPtlUser;
import com.sihai.ecps.service.EbCartService;
import com.sihai.ecps.service.EbOrderService;
import com.sihai.ecps.service.EbShipAddrService;

@RequestMapping("/order")
@Controller
public class EbOrderController {
	
	@Autowired
	private EbShipAddrService shipAddrService;
	@Autowired
	private EbCartService cartService;
	@Autowired
	private EbOrderService orderService;
	
	@RequestMapping("/toSubmitOrder.do")
	public String toSubmitOrder(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model){
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(user != null){
			List<EbShipAddr> addrList = shipAddrService.selectAddrByUserId(user.getPtlUserId());
			model.addAttribute("addrList", addrList);
		}else{
			return "redirect:/user/toLogin.do";
		}
		//查询当前订单信息
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
		return "shop/confirmProductCase";
	}
	
	@RequestMapping("/submitOrder.do")
	public String submitOrder(HttpServletResponse response, HttpServletRequest request,EbOrder order,
			HttpSession session, String address, Model model) throws Exception{
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		if(user != null){
			order.setPtlUserId(user.getPtlUserId());
			order.setUsername(user.getUsername());
		}
		order.setOrderNum(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		//1.如果不是新添加的地址，則通過地址的id查詢當前的地址
		//2.新添加的地址，會自動的賦值給order對象
		if(!StringUtils.equals("add", address)){
			EbShipAddr addr = shipAddrService.selectAddrByShipAddrId(new Long(address));
			BeanUtils.copyProperties(order, addr);
		}
		List<EbCart> cartList = cartService.listCart(request, response);
		List<EbOrderDetail> detailList = new ArrayList<EbOrderDetail>();
		for(EbCart cart:cartList){
			EbOrderDetail detail = new EbOrderDetail();
			detail.setItemId(cart.getSku().getItem().getItemId());
			detail.setItemName(cart.getSku().getItem().getItemName());
			detail.setItemNo(cart.getSku().getItem().getItemNo());
			detail.setSkuId(cart.getSkuId());
			String specVal = "";
			List<EbSpecValue> specList = cart.getSku().getSpecList();
			for(EbSpecValue spec : specList){
				specVal = specVal + spec.getSpecValue()+",";
			}
			specVal = specVal.substring(0, specVal.length() - 1);
			detail.setSkuSpec(specVal);
			detail.setQuantity(cart.getQuantity());
			detail.setSkuPrice(cart.getSku().getSkuPrice());
			detail.setMarketPrice(cart.getSku().getMarketPrice());
			detailList.add(detail);
		}
		try {
			String processInstanceId = orderService.saveOrder(response, request, order, detailList);
			model.addAttribute("order", order);
			model.addAttribute("processInstanceId", processInstanceId);
		} catch (Exception e) {
			if(e instanceof EbStockException){
				model.addAttribute("tip", "stock_error");
			}
		}
		return "shop/confirmProductCase2";
	}
	
	/**
	 * 订单支付
	 */
	@RequestMapping("/pay.do")
	public void pay(String processInstanceId, Long orderId, PrintWriter out){
		orderService.pay(processInstanceId, orderId);
		out.write("success");
	}
}
