package com.sihai.ecps.service;

import java.util.List;

import com.sihai.ecps.model.TaskBean;


public interface FlowService {
	/**
	 * 流程定义
	 */
	public void deployFlow();
	
	/**
	 * 开启一个流程实例（在提交订单的时候启动）
	 * @param orderId 订单id当作流程实例businessKey(相当于外键)
	 * @return
	 */
	public String startProcess(Long orderId);
	
	/**
	 * 根据流程实例id和流程变量完成当前任务节点
	 * @param processInstanceId 流程实例id 
	 * @param outcome 流程变量
	 */
	public void completeTaskByPId(String processInstanceId, String outcome);
	
	/**
	 * 根据办理人查询taskBean
	 * @param assignee 办理人
	 * @return
	 */
	public List<TaskBean> selectTaskBeanByAssignee(String assignee);
	
	public TaskBean selectTaskBeanByTaskId(String taskId);
	
	public void compeleTaskByTaskId(String taskId, String outcome);
}
