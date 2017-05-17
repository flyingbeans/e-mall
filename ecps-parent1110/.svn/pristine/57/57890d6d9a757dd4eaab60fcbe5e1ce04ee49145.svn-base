package com.sihai.ecps.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.service.EbBrandService;

@Controller
@RequestMapping("/brand")
public class EbBrandController {

	@Autowired
	private EbBrandService ebBrandService;

	@RequestMapping("/toItemIndex.do")
	public String toItemIndex() {
		return "item/index";
	}

	/**
	 * 查询品牌
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/listBrand.do")
	public String listBrand(Model model) {
		List<EbBrand> bList = ebBrandService.selectBrand();
		model.addAttribute("bList", bList);
		return "/item/listbrand";
	}

	@RequestMapping("/toAddBrand.do")
	public String toAddBrand() {
		return "/item/addbrand";
	}

	/**
	 * 验证品牌名称重复性
	 * 
	 * @param brandName
	 * @param out
	 * @throws IOException
	 */
	@RequestMapping("/validBrandName.do")
	public void validBrandName(String brandName, Writer out) throws IOException {
		List<EbBrand> bList = ebBrandService.selectBrandByName(brandName);
		String flag = "no";
		if (bList.size() > 0) {
			flag = "yes";
		}
		out.write(flag);
	}

	/**
	 * 品牌添加
	 * 
	 * @param brand
	 * @return
	 */
	@RequestMapping("/addBrand.do")
	public String addBrand(EbBrand brand) {
		ebBrandService.saveBrand(brand);
		return "redirect:listBrand.do";
	}

	@RequestMapping("/getBrand.do")
	public String getBrand(Long brandId, Model model) {
		model.addAttribute("brand", ebBrandService.getBrandById(brandId));
		return "item/editbrand";
	}

	@RequestMapping("/updateBrand.do")
	public String updateBrand(EbBrand brand) {
		ebBrandService.updateBrand(brand);
		return "redirect:listBrand.do";
	}

	@RequestMapping("/deleteBrand.do")
	public String deleteBrand(Long brandId) {
		ebBrandService.deleteBrand(brandId);
		return "redirect:listBrand.do";
	}

}
