package com.sihai.ecps.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbShipAddr;
import com.sihai.ecps.model.TsPtlUser;
import com.sihai.ecps.service.TsPtlUserService;
import com.sihai.ecps.utils.ECPSUtils;
import com.sihai.ecps.utils.MD5;

@RequestMapping("user")
@Controller
public class EbUserController {
	
	@Autowired
	private TsPtlUserService userService;
	
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		return "passport/login";
	}
	
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out
				.println("#######################生成数字和字母的验证码#######################");
		BufferedImage img = new BufferedImage(68, 22,
		BufferedImage.TYPE_INT_RGB);
		// 得到该图片的绘图对象
		Graphics g = img.getGraphics();
		Random r = new Random();
		Color c = new Color(200, 150, 255);
		g.setColor(c);
		// 填充整个图片的颜色
		g.fillRect(0, 0, 68, 22);
		// 向图片中输出数字和字母
		StringBuffer sb = new StringBuffer();
		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		int index, len = ch.length;
		for (int i = 0; i < 4; i++) {
			index = r.nextInt(len);
			g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt
			(255)));
			g.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 22));
			// 输出的 字体和大小
			g.drawString("" + ch[index], (i * 15) + 3, 18);
			// 写什么数字，在图片 的什么位置画
			sb.append(ch[index]);
		}
		request.getSession().setAttribute("piccode", sb.toString());
		ImageIO.write(img, "JPG", response.getOutputStream());
	}
	
	@RequestMapping("/login.do")
	public String login(String username, String password, String captcha, HttpSession session, Model model){
		//获得正确的验证码的值
		String picCode = (String) session.getAttribute("piccode");
		if(!StringUtils.equalsIgnoreCase(captcha, picCode)){
			model.addAttribute("tip", "caperror");
			return "passport/login";
		}
		password = new MD5().GetMD5Code(password);
		Map<String, String> map = new HashMap<String,String>();
		map.put("username", username);
		map.put("password", password);
		//根据用户名和密码来查询用户
//		TsPtlUser user = userService.selectUserByUsernameAndPwd(map);
		TsPtlUser user = new TsPtlUser();
		user.setUsername("sihai");
		user.setPtlUserId((long)10003);
		if(user == null){
			model.addAttribute("tip", "userpasserror");
			return "passport/login";
		}
		session.setAttribute("user", user);
		//如果是:后面没有/在同一个Controller中重定向
		//如果是：后面有/是在不同的Controller中重定向
		return "redirect:/item/toIndex.do";
	}
	
	@RequestMapping("/loginAjax.do")
	public void loginAjax(String username, String password, String captcha, HttpSession session,HttpServletResponse response) throws IOException{
		String result = "success";
		//获得正确的验证码的值
		String picCode = (String) session.getAttribute("piccode");
		if(!StringUtils.equalsIgnoreCase(captcha, picCode)){
			result = "caperror";
		}
		password = new MD5().GetMD5Code(password);
		Map<String, String> map = new HashMap<String,String>();
		map.put("username", username);
		map.put("password", password);
		//根据用户名和密码来查询用户
//		TsPtlUser user = userService.selectUserByUsernameAndPwd(map);
		TsPtlUser user = new TsPtlUser();
		user.setUsername("sihai");
		user.setPtlUserId((long)10003);
		if(user == null){
			result = "userpasserror";
		}
		response.getWriter().print(result);
	}
	
	
	@RequestMapping("/getUser.do")
	public void getUser(HttpSession session, HttpServletResponse response){
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
//		TsPtlUser user = new TsPtlUser();
//		user.setUsername("sihai");
//		user.setPtlUserId((long)10003);
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("user", user);
		String result = jsonObject.toString();
		//设置中文乱码
		ECPSUtils.printJson(result, response);
	}
	
	@RequestMapping("/login/toPersonal.do")
	public String toPersonal(){
		return "person/index";
	}
	
	/**
	 * 收货地址管理
	 * @param model
	 * @return
	 */
	@RequestMapping("/login/toAddr.do")
	public String toAddr(Model model){
		List<EbShipAddr> addrList = userService.selectAddr();
		model.addAttribute("addrList", addrList);
		return "person/deliverAddress";
	}
	
	/**
	 * 根据收货地址id获取收货地址
	 * @param shipAddrId 收货地址id
	 */
	@RequestMapping("/login/getAddr.do")
	public void getAddr(Long shipAddrId,HttpServletResponse response){
		EbShipAddr shipAddr = userService.selectAddrByShipAddrId(shipAddrId);
		JSONObject addrJson = new JSONObject();
		addrJson.accumulate("shipAddr", shipAddr);
		String result = addrJson.toString();
		ECPSUtils.printJson(result, response);
	}
	
	@RequestMapping("/login/saveOrUpdateShipAddr.do")
	public String saveOrUpdateShipAddr(EbShipAddr ebShipAddr,HttpSession session){
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		//根据id判断是添加收货地址还是修改收货地址
		if(ebShipAddr.getDefaultAddr() == null){
			ebShipAddr.setDefaultAddr((short)0);
		}
		if(ebShipAddr.getShipAddrId() == null){
			userService.insertShipAddr(ebShipAddr,user.getPtlUserId());
		} else {
			userService.updateShipAddr(ebShipAddr,user.getPtlUserId());
		}
		return "redirect:toAddr.do";
	}
	
	@RequestMapping("/login/updateDefault.do")
	public String updateDefault(Long shipAddrId){
		userService.updateShipAddrDefault(shipAddrId);
		return "redirect:toAddr.do";
	}
}
