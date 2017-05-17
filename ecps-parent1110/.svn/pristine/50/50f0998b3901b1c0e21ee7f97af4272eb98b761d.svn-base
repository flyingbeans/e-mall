package com.sihai.ecps.service.impl;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.service.EbBrandService;
import com.sihai.ecps.service.FlowService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class EbBrandServiceImplTest {

	/*
	 * @Autowired private EbBrandService brandService;
	 */
	ApplicationContext ctx;
	@Autowired
	private FlowService flowService;

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans.xml");
	}

	@Test
	public void testSaveBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetBrandById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateBrand() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBrand() {
		EbBrandService service = (EbBrandService) ctx.getBean("ebBrandServiceImpl");
		List<EbBrand> list = service.selectBrand();

		System.out.println(list);
	}

	@Test
	public void testSelectBrandByName() {
		EbBrandService service = (EbBrandService) ctx.getBean("ebBrandServiceImpl");
		List<EbBrand> list = service.selectBrandByName("1");
		System.out.println(list);
	}
	
	@Test
	public void deploy(){
		flowService.deployFlow();
	}

}
