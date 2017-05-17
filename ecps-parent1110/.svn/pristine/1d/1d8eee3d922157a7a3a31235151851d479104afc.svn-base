package com.sihai.ecps.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbOrderDao;
import com.sihai.ecps.dao.EbOrderDetailDao;
import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.exception.EbStockException;
import com.sihai.ecps.model.EbOrder;
import com.sihai.ecps.model.EbOrderDetail;
import com.sihai.ecps.model.TaskBean;
import com.sihai.ecps.service.EbCartService;
import com.sihai.ecps.service.EbOrderService;
import com.sihai.ecps.service.FlowService;
@Service
public class EbOrderServiceImpl implements EbOrderService {

	@Autowired
	private EbOrderDao orderDao;
	@Autowired
	private EbOrderDetailDao detailDao;
	
	@Autowired
	private EbSkuDao skuDao;
	
	@Autowired
	private EbCartService cartService;
	
	@Autowired
	private FlowService flowService;
	

	public String saveOrder(HttpServletResponse response, HttpServletRequest request,
			EbOrder order, List<EbOrderDetail> detailList)throws EbStockException {
		orderDao.saveOrder(order);
		Map<String,Object> map = new HashMap<String,Object>();
		for(EbOrderDetail detail : detailList){
			//給訂單詳情設置訂單id
			detail.setOrderId(order.getOrderId());
			detailDao.saveOrderDetail(detail);
			
			/*EbSku sku = skuDao.getSkuById(detail.getSkuId());
			
			sku.setStockInventory(sku.getStockInventory() - detail.getQuantity());
			skuDao.update(sku);*/
			map.put("skuId", detail.getSkuId());
			map.put("quantity", detail.getQuantity());
			//為了防止并发问题，这里可以使用：
			//1.悲观锁：对查询语句进行锁，即for update
			//2.乐观锁：对修改语句进行锁，即条件加判断条件：会返回影响数量
			int flag = skuDao.updateStock(map);
			if(flag == 0){
				throw new EbStockException("库存不足");
			}
			
		}
		//保存订单时，开启一个流程实例
		String processInstanceId = flowService.startProcess(order.getOrderId());
		cartService.clearCart(request, response);
		return processInstanceId;
	}
	
	public void pay(String processInstanceId, Long orderId){
		//修改订单支付状态
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsPaid((short)1);
		orderDao.updateOrder(order);
		//完成订单支付节点
		flowService.completeTaskByPId(processInstanceId, "支付");
	}

	public List<TaskBean> listNoPayOrder(Short isCall, String assignee) {
		/**
		 * 1.根据办理人查询到task和businesskey
		 * 2.根据businesskey查询订单
		 * 3.根据iscall查询未支付的订单
		 */
		List<TaskBean> tbList1 = new ArrayList<TaskBean>();
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assignee);
		for (TaskBean tb : tbList) {
			EbOrder order = orderDao.selectOrderById(tb.getBusinessKey());
			//查询没有付款的订单
			if(order.getIsCall().shortValue() == isCall.shortValue()){
				tb.setOrder(order);
				tbList1.add(tb);
			}
		}
		return tbList1;
	}

	public EbOrder selectOrderAndDetailById(Long orderId) {
		return orderDao.selectOrderAndDetailById(orderId);
	}

	public void updateOrder(Long orderId) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setIsCall((short)1);
		orderDao.updateOrder(order);
	}

	public List<TaskBean> listPaidOrder(String assignee) {
		/**
		 * 1.根据办理人查询到task和businesskey
		 * 2.根据businesskey查询订单
		 * 3.根据iscall查询未支付的订单
		 */
		List<TaskBean> tbList = flowService.selectTaskBeanByAssignee(assignee);
		for (TaskBean tb : tbList) {
			EbOrder order = orderDao.selectOrderById(tb.getBusinessKey());
			//查询没有付款的订单
			tb.setOrder(order);
		}
		return tbList;
	}
	
	public TaskBean selectTaskBeanByOrderIdAndTaskId(Long orderId, String taskId) {
		EbOrder order = orderDao.selectOrderAndDetailById(orderId);
		TaskBean tb = flowService.selectTaskBeanByTaskId(taskId);
		tb.setOrder(order);
		return tb;
	}

	public void compeleTask(String taskId, String outcome, Long orderId) {
		EbOrder order = new EbOrder();
		order.setOrderId(orderId);
		order.setUpdateTime(new Date());
		flowService.compeleTaskByTaskId(taskId, outcome);
	}
	
	

}
