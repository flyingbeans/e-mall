package com.sihai.ecps.utils;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

public class FlowOrderListener implements TaskListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5720278977071364296L;

	public void notify(DelegateTask delegateTask) {
		String key = delegateTask.getTaskDefinitionKey();
		delegateTask.setAssignee(key+"er");
	}

}
