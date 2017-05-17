package com.sihai.ecps.controller;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sihai.ecps.utils.ECPSUtils;
import com.sihai.ecps.utils.UploadResponse;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/upload")
public class EbUploadController {
	
	@RequestMapping("/uploadPic.do")
	public void uploadPic(HttpServletRequest request, Writer out) throws IOException{
		//把request转换成复杂request
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
		//获得文件
		Map<String, MultipartFile> map = mr.getFileMap();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		String fileInputName = it.next();
		MultipartFile mf = map.get(fileInputName);
		//获得文件的字节数组
		byte [] bs = mf.getBytes();
		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		for(int i = 0; i < 3; i++){
			fileName = fileName + random.nextInt(10);
		}
		
		String oriFileName = mf.getOriginalFilename();
		//获得文件的后缀
		String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
		//获得上传文件的绝对路径
		String realPath = ECPSUtils.readProp("file_path")+"/upload/"+fileName+suffix;
		//获得相对路径
		String relativePath = "/upload/"+fileName+suffix;
		//创建jersey的客户端
		Client client = Client.create();
		//创建web资源对象
		WebResource wr = client.resource(realPath);
		//上传
		wr.put(bs);
		//转json
		JSONObject jo = new JSONObject();
		jo.accumulate("realPath", realPath);
		jo.accumulate("relativePath", relativePath);
		String result = jo.toString();
		out.write(result);
	}
	
	@RequestMapping("/uploadForFck.do")
	public void uploadForFck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//把request转换成复杂request
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
		//获得文件
		Map<String, MultipartFile> map = mr.getFileMap();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		String fileInputName = it.next();
		MultipartFile mf = map.get(fileInputName);
		//获得文件的字节数组
		byte [] bs = mf.getBytes();
		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		for(int i = 0; i < 3; i++){
			fileName = fileName + random.nextInt(10);
		}
		
		String oriFileName = mf.getOriginalFilename();
		//获得文件的后缀
		String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
		//获得上传文件的绝对路径
		String realPath = ECPSUtils.readProp("file_path")+"/upload/"+fileName+suffix;
		//获得相对路径
		String relativePath = "/upload/"+fileName+suffix;
		//创建jersey的客户端
		Client client = Client.create();
		//创建web资源对象
		WebResource wr = client.resource(realPath);
		//上传
		wr.put(bs);
		//按照fckEditor的规范上传
		UploadResponse ur = new UploadResponse(UploadResponse.EN_OK,realPath);
		response.getWriter().print(ur);;
	}

}
