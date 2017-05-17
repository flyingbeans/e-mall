package com.sihai.ecps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbOrder;
import com.sihai.ecps.model.TaskBean;
import com.sihai.ecps.service.EbOrderService;

@Controller
@RequestMapping("/order")
public class EbOrderController {
	
	@Autowired
	private EbOrderService orderService;
	
	@RequestMapping("/toOrderIndex.do")
	public String toOrderIndex(){
		return "order/index";
	}
	
	/**
	 * 查询未付款订单
	 */
	@RequestMapping("/listNoPayOrder.do")
	public String listNoPayOrder(Short isCall, String assignee, Model model){
		List<TaskBean> tbList = orderService.listNoPayOrder(isCall, assignee);
		model.addAttribute("tbList", tbList);
		model.addAttribute("isCall", isCall);
		return "order/orderPay/orderPay";
	}
	
	/**
	 * 查询订单和订单详细信息
	 * 
	 */
	@RequestMapping("/selectOrderAndDetail.do")
	public String selectOrderAndDetail(Long orderId, Model model){
		EbOrder order = orderService.selectOrderAndDetailById(orderId);
		model.addAttribute("order", order);
		return "order/orderPay/detail";
	}
	
	/**
	 * 完成外呼
	 */
	@RequestMapping("/call.do")
	public String call(Long orderId){
		orderService.updateOrder(orderId);
		return "redirect:listNoPayOrder.do?isCall=0&assignee=noPaidOrderer";
	}
	
	/**
	 * 查询未付款订单
	 */
	@RequestMapping("/listPaidOrder.do")
	public String listPaidOrder(String assignee, Model model){
		List<TaskBean> tbList = orderService.listPaidOrder(assignee);
		model.addAttribute("tbList", tbList);
		return "order/orderCall/orderCall";
	}
	
	@RequestMapping("/selectPaidOrderDetail.do")
	public String selectPaidOrderDetail(String taskId, Long orderId, Model model){
		TaskBean tb = orderService.selectTaskBeanByOrderIdAndTaskId(orderId, taskId);
		model.addAttribute("tb", tb);
		return "order/orderCall/detail";
	}
	
	@RequestMapping("/completeTask.do")
	public String compeleTask(Long orderId, String taskId, String outcome){
		orderService.compeleTask(taskId, outcome, orderId);
		return "redirect:listPaidOrder.do?assignee=paidOrderer";
	}
	
}
