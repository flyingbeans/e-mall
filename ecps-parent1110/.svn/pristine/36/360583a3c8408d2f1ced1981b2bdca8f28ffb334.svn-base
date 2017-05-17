package com.sihai.ecps.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sihai.ecps.service.FlowService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class ActivitiTest {
	
	@Autowired
	private FlowService flowService;
	
	@Test
	public void test() {
		flowService.deployFlow();
	}

}
