package com.sihai.ecps.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sihai.ecps.exception.EbStockException;
import com.sihai.ecps.model.EbOrder;
import com.sihai.ecps.model.EbOrderDetail;
import com.sihai.ecps.model.TaskBean;

public interface EbOrderService {
	
	/**
	 * 保存订单
	 * @param response 
	 * @param request
	 * @param order 订单实体
	 * @param detailList 订单明细列表
	 * @throws EbStockException 异常信息
	 */
	public String saveOrder(HttpServletResponse response,
			HttpServletRequest request,EbOrder order, List<EbOrderDetail> detailList)throws EbStockException ;
	
	/**
	 * 订单支付
	 * @param processInstanceId 流程实体id
	 * @param orderId 订单id
	 */
	public void pay(String processInstanceId, Long orderId);
	
	/**
	 * 查询未付款订单
	 * @param isCall 是否外呼参数
	 * @param assignee 办理人
	 * @return
	 */
	public List<TaskBean> listNoPayOrder(Short isCall, String assignee);
	
	/**
	 * 根据订单id查询订单和订单详情
	 * @param orderId 订单id
	 * @return
	 */
	public EbOrder selectOrderAndDetailById(Long orderId);
	
	/**
	 * 更新订单
	 * @param orderId 订单id
	 */
	public void updateOrder(Long orderId);
	
	/**
	 * 查询已付款订单
	 * @param assignee
	 * @return
	 */
	public List<TaskBean> listPaidOrder(String assignee);
	
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId, String taskId);
	
	public void compeleTask(String taskId, String outcome, Long orderId);
	
}
