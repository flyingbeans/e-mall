package com.sihai.ecps.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.service.EbItemService;
import com.sihai.ecps.utils.FMutil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml"})
public class TestFtl {
	
	@Autowired
	private EbItemService service;
	
	/*ApplicationContext ctx;

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans.xml");
	}
*/
	
	@Test
	public void test() throws Exception {
//		EbItemService service = (EbItemService) ctx.getBean("ebItemServiceImpl");
		EbItem item = service.selectItemDetailById(3121l);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		FMutil fMutil = new FMutil();
		fMutil.ouputFile("productDetail.ftl", item.getItemId()+".html", map);
	}

}
