package com.sihai.ecps.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.model.TaskBean;
import com.sihai.ecps.service.FlowService;

@Service
public class FlowServiceImpl implements FlowService {
	
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	
	public void deployFlow() {
		DeploymentBuilder db = repositoryService.createDeployment();
		db.addClasspathResource("com/sihai/ecps/diagrams/OrderFlow.bpmn")
		  .addClasspathResource("com/sihai/ecps/diagrams/OrderFlow.png");
		db.deploy();
	}

	public String startProcess(Long orderId) {
		ProcessInstance pi = runtimeService.startProcessInstanceByKey("OrderFlow", orderId+"");
		return pi.getId();
	}

	public void completeTaskByPId(String processInstanceId, String outcome) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("outcome", outcome);
		Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
		taskService.complete(task.getId(), map);
	}

	public List<TaskBean> selectTaskBeanByAssignee(String assignee) {
		//根据办理人查询任务列表
		List<Task> tList = taskService.createTaskQuery()
		.processDefinitionKey("OrderFlow")
		.taskAssignee(assignee)
		.orderByTaskCreateTime()
		.desc()
		.list();
		List<TaskBean> tbList = new ArrayList<TaskBean>();
		for (Task task : tList) {
			//设置任务和businesskey
			TaskBean tb = new TaskBean();
			tb.setTask(task);
			ProcessInstance pi = runtimeService.createProcessInstanceQuery()
					.processDefinitionKey("OrderFlow")
					.processInstanceId(task.getProcessInstanceId())
					.singleResult();
			String businessKey = pi.getBusinessKey();
			tb.setBusinessKey(businessKey);
			tbList.add(tb);
		}
		return tbList;
	}
	
	public TaskBean selectTaskBeanByTaskId(String taskId) {
		Task task = taskService.createTaskQuery().processDefinitionKey("OrderFlow").taskId(taskId).singleResult();
		TaskBean tb = new TaskBean();
		tb.setTask(task);
		List<String> outcomes = this.getOutcomes(task);
		tb.setOutcomes(outcomes);
		return tb;
	}
	
	public List<String> getOutcomes(Task task){
		List<String> outcomes = new ArrayList<String>();
		//获得流程定义的对象
		ProcessDefinitionEntity pe = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(task.getProcessDefinitionId());
		//获得流程实例对象
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processDefinitionKey("OrderFlow")
		.processInstanceId(task.getProcessInstanceId()).singleResult();
		ActivityImpl ai = pe.findActivity(pi.getActivityId());
		//获得往外面走的线路的对象
		List<PvmTransition> ptList = ai.getOutgoingTransitions();
	
		for(PvmTransition pt : ptList){
			String name = (String) pt.getProperty("name");
			outcomes.add(name);
		}
		return outcomes;
	}


	public void compeleTaskByTaskId(String taskId, String outcome) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("outcome", outcome);
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		taskService.complete(task.getId(), map);
	}

	
	

}
