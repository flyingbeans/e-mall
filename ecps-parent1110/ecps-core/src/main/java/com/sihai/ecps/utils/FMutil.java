package com.sihai.ecps.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FMutil {
	
	/**
	 * 
	 * @param ftlName：模板名
	 * @param fileName：生成的html名字
	 * @param map 数据库中的数据
	 * @throws Exception
	 */
	public void ouputFile(String ftlName, String fileName,  Map<String, Object> map) throws Exception{
		//创建fm的配置
		Configuration config = new Configuration();
		//指定默认编码格式
		config.setDefaultEncoding("UTF-8");
		//设置模板的包路径
		config.setClassForTemplateLoading(this.getClass(), "/com/sihai/ecps/ftl");
		//获得包的模板
		Template template = config.getTemplate(ftlName);
		//指定文件输出的路径
		String path = "E:/java学习资料/项目/ecps-parent1110/ecps-portal/src/main/webapp/static";
		//定义输出流，注意的必须指定编码
		Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path+"/"+fileName)),"UTF-8"));
		//生成模板
		template.process(map, writer);
	}
	
	
}
