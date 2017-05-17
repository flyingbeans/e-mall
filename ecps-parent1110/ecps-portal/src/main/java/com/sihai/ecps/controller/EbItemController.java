package com.sihai.ecps.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbFeature;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.service.EbBrandService;
import com.sihai.ecps.service.EbFeatureService;
import com.sihai.ecps.service.EbItemService;
import com.sihai.ecps.utils.ECPSUtils;

@RequestMapping("item")
@Controller
public class EbItemController {
	
	@Autowired
	private EbBrandService brandService;
	@Autowired
	private EbFeatureService featureService;
	@Autowired
	private EbItemService itemService;
	
	@RequestMapping("/toIndex.do")
	public String toIndex(Model model){
		List<EbBrand> bList = brandService.selectBrand();
		List<EbFeature> fList = featureService.selectIsSelFeature();
		model.addAttribute("bList", bList);
		model.addAttribute("fList", fList);
		return "index";
	}
	
	@RequestMapping("/listItem.do")
	public String listItem(Model model, String price, Long brandId, String paraStr){
		List<EbItem> itemList = itemService.listItem(price, brandId, paraStr);
		model.addAttribute("itemList", itemList);
		return "phoneClassification";
	}
	
	@RequestMapping("/toProductDetail.do")
	public String toProductDetail(Long itemId, Model model){
		EbItem item = itemService.selectItemDetailById(itemId);
		model.addAttribute("item", item);
		return "productDetail";
	}
	
	@RequestMapping("/getSkuById.do")
	public void getSkuById(Long skuId, HttpServletResponse response){
		EbSku sku = itemService.selectByPrimaryKey(skuId);
		JSONObject skuObj = new JSONObject();
		skuObj.accumulate("sku", sku);
		String result = skuObj.toString();
		ECPSUtils.printJson(result, response);
	}
}
