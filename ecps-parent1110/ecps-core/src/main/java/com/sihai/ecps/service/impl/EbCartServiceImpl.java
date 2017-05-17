package com.sihai.ecps.service.impl;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sihai.ecps.dao.EbSkuDao;
import com.sihai.ecps.model.EbCart;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.service.EbCartService;
import com.sihai.ecps.utils.ECPSUtils;

@Service
public class EbCartServiceImpl implements EbCartService {
	
	@Autowired
	private EbSkuDao skuDao;
	
	public List<EbCart> listCart(HttpServletRequest request,
			HttpServletResponse response) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		//获取浏览器所有cookie
		Cookie[] cookies = request.getCookies();
		//[{skuId:1,quantity:2},{}]
		if(cookies != null && cookies.length > 0){
			for (Cookie cookie : cookies) {
				String code = ECPSUtils.readProp("cookie_ecps_code");
				String name = cookie.getName();
				if(StringUtils.equals(name, code)){
					String result = cookie.getValue();
					//对其进行解码，防止中文乱码
					result = URLDecoder.decode(result);
					JSONArray ja = JSONArray.fromObject(result);
					JsonConfig jc = new JsonConfig();
					//设置要转换的类
					jc.setRootClass(EbCart.class);
					//排除类里面的属性
					jc.setExcludes(new String[]{"sku"});
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					//根据skuid设置购物车对象的EbSku对象
					for (EbCart cart : cartList) {
						EbSku sku = skuDao.getSkuDetailById(cart.getSkuId());
						cart.setSku(sku);
					}
				}
			}
		}
		
		return cartList;
	}

	public void addCart(HttpServletRequest request,
			HttpServletResponse response, Long skuId, Integer quantity) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//json的配置对象
		JsonConfig jc = new JsonConfig();
		//设置要转换的类
		jc.setRootClass(EbCart.class);
		//设置不需要转换的属性
		jc.setExcludes(new String[]{"sku"});
		Cookie[] cookies = request.getCookies();
		if(cookies != null&&cookies.length > 0){
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String cookieKey = ECPSUtils.readProp("cookie_ecps_code");
				if(StringUtils.equals(name, cookieKey)){
					//获得cookie的值
					String result = cookie.getValue();
					//[{skuId:1002, quantity:2}, {skuId:1003, quantity:3},....]
					result = URLDecoder.decode(result);
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//把json的数组转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					
					boolean isExsits = false;
					//1.如果存在对应商品，则在基础上数量加一
					for(EbCart cart: cartList){
						if(cart.getSkuId().longValue() == skuId.longValue()){
							cart.setQuantity(cart.getQuantity() + quantity);
							isExsits = true;
						}
					}
					//2.如果不存在，则创建新的对象
					if(!isExsits){
						EbCart cartObj = new EbCart();
						cartObj.setSkuId(skuId);
						cartObj.setQuantity(quantity);
						cartList.add(cartObj);
					}
					
				}
			}
		}
		//3.如果没有创建过cookie对象，则创建
		if(cartList.size() == 0){
			EbCart cartObj = new EbCart();
			cartObj.setSkuId(skuId);
			cartObj.setQuantity(quantity);
			cartList.add(cartObj);
		}
		//将java对象再次转换为字符串存到cookie中
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie("cookie_ecps_code", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public void addNum(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//json的配置对象
		JsonConfig jc = new JsonConfig();
		//设置要转换的类
		jc.setRootClass(EbCart.class);
		//设置不需要转换的属性
		jc.setExcludes(new String[]{"sku"});
		Cookie[] cookies = request.getCookies();
		if(cookies != null&&cookies.length > 0){
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String cookieKey = ECPSUtils.readProp("cookie_ecps_code");
				if(StringUtils.equals(name, cookieKey)){
					//获得cookie的值
					String result = cookie.getValue();
					//[{skuId:1002, quantity:2}, {skuId:1003, quantity:3},....]
					result = URLDecoder.decode(result);
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//把json的数组转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					
					for(EbCart cart: cartList){
						if(cart.getSkuId().longValue() == skuId.longValue()){
							cart.setQuantity(cart.getQuantity() + 1);
						}
					}
					
				}
			}
		}
		//将java对象再次转换为字符串存到cookie中
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie("cookie_ecps_code", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	@SuppressWarnings("deprecation")
	public void reduceNum(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		Cookie[] cookies = request.getCookies();
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		if(cookies != null && cookies.length > 0){
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				String code = ECPSUtils.readProp("cookie_ecps_code");
				if(StringUtils.equals(name, code)){
					String result = cookie.getValue();
					//将html编码解码
					result = URLDecoder.decode(result);
					JSONArray ja = JSONArray.fromObject(result);
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					for(EbCart cart : cartList){
						if(cart.getSkuId().longValue() == skuId.longValue()){
							cart.setQuantity(cart.getQuantity() - 1);
						}
					}
				}
			}
		}
		//将java对象再次转换为字符串存到cookie中
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie("cookie_ecps_code", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public void deleteCart(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//json的配置对象
		JsonConfig jc = new JsonConfig();
		//设置要转换的类
		jc.setRootClass(EbCart.class);
		//设置不需要转换的属性
		jc.setExcludes(new String[]{"sku"});
		Cookie[] cookies = request.getCookies();
		if(cookies != null&&cookies.length > 0){
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String cookieKey = ECPSUtils.readProp("cookie_ecps_code");
				if(StringUtils.equals(name, cookieKey)){
					//获得cookie的值
					String result = cookie.getValue();
					//[{skuId:1002, quantity:2}, {skuId:1003, quantity:3},....]
					result = URLDecoder.decode(result);
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//把json的数组转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					
					for(EbCart cart: cartList){
						if(cart.getSkuId().longValue() == skuId.longValue()){
							cartList.remove(cart);
						}
					}
					
				}
			}
		}
		//将java对象再次转换为字符串存到cookie中
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie("cookie_ecps_code", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public void clearCart(HttpServletRequest request,
			HttpServletResponse response) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//json的配置对象
		JsonConfig jc = new JsonConfig();
		//设置要转换的类
		jc.setRootClass(EbCart.class);
		//设置不需要转换的属性
		jc.setExcludes(new String[]{"sku"});
		Cookie[] cookies = request.getCookies();
		if(cookies != null&&cookies.length > 0){
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String cookieKey = ECPSUtils.readProp("cookie_ecps_code");
				if(StringUtils.equals(name, cookieKey)){
					//获得cookie的值
					String result = cookie.getValue();
					//[{skuId:1002, quantity:2}, {skuId:1003, quantity:3},....]
					result = URLDecoder.decode(result);
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//把json的数组转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					cartList.clear();
				}
			}
		}
		
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		Cookie cookie = new Cookie("cookie_ecps_code", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public String validCookie(HttpServletRequest request,
			HttpServletResponse response) {
		/**
		 * 1.创建cookie设置到浏览器
		 * 2.取cookie，看是否能拿到，如果拿到，说明浏览器cookie正常，否则，关闭了
		 */
		Cookie cookie = new Cookie("test", "test");
		response.addCookie(cookie);
		Cookie[] cookies = request.getCookies();
		String result = "yes";//默认为cookie可用
		if(cookies != null && cookies.length > 0){
			for (Cookie cookie2 : cookies) {
				String name = cookie2.getName();
				String value = cookie2.getValue();
				System.out.println(name+"="+value);
				if((StringUtils.equals("test", name) && StringUtils.equals("test", value))){
					result = "no";
				}
			}
		}
		System.out.println(result);
		return "yes";
	}

	public String validCar(HttpServletRequest request,
			HttpServletResponse response) {
		String result1 = "success";
		List<EbCart> cartList = new ArrayList<EbCart>();
		//获得当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null&&cookies.length > 0){
			for(Cookie cookie : cookies){
				String name = cookie.getName();
				String cookieKey = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, cookieKey)){
					//获得cookie的值
					String result = cookie.getValue();
					//[{skuId:1002, quantity:2}, {skuId:1003, quantity:3},....]
					result = URLDecoder.decode(result);
					//把json格式的字符串转换成json数组对象
					JSONArray ja = JSONArray.fromObject(result);
					//json的配置对象
					JsonConfig jc = new JsonConfig();
					//设置要转换的类
					jc.setRootClass(EbCart.class);
					//设置不需要转换的属性
					jc.setExcludes(new String[]{"sku"});
					//把json的数组转换成java集合
					cartList = (List<EbCart>) JSONSerializer.toJava(ja, jc);
					for (EbCart cart : cartList) {
						//判断库存商品数量是否大于购买数量
						EbSku sku = skuDao.getSkuDetailById(cart.getSkuId());
						if(sku.getStockInventory().intValue() < cart.getQuantity().intValue()){
							//提示信息：哪个商品什么规格不足多少
							result1 = sku.getItem().getItemName();//哪个商品
							for(EbSpecValue spec : sku.getSpecList()){
								result1 = result1 + spec.getSpecValue();//哪个规格
							}
							result1 = result1 + "不足" + cart.getQuantity();//不足多少
							break;//循环到库存不足的商品就跳出
						}
					}
				}
			}
		}
		return result1;
	}
	

}
