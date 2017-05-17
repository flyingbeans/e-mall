package com.sihai.ecps.controller;

import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sihai.ecps.model.EbBrand;
import com.sihai.ecps.model.EbFeature;
import com.sihai.ecps.model.EbItem;
import com.sihai.ecps.model.EbItemClob;
import com.sihai.ecps.model.EbParaValue;
import com.sihai.ecps.model.EbSku;
import com.sihai.ecps.model.EbSpecValue;
import com.sihai.ecps.model.QueryCondition;
import com.sihai.ecps.service.EbBrandService;
import com.sihai.ecps.service.EbFeatureService;
import com.sihai.ecps.service.EbItemService;
import com.sihai.ecps.utils.ECPSUtils;
import com.sihai.ecps.utils.Page;

@Controller
@RequestMapping("/item")
public class EbItemController {

	@Autowired
	private EbItemService itemService;
	@Autowired
	private EbBrandService brandService;
	@Autowired
	private EbFeatureService featureService;

	@RequestMapping("/listItem.do")
	public String listItem(QueryCondition qc, Model model) {
		if (qc.getPageNo() == null) {
			qc.setPageNo(1);
		}
		// 查询所有品牌
		List<EbBrand> bList = brandService.selectBrand();
		model.addAttribute("bList", bList);
		// 根据条件查询商品
		Page page = itemService.selectItemByCondition(qc);
		model.addAttribute("page", page);
		model.addAttribute("qc", qc);
		return "item/list";
	}

	@RequestMapping("/toAddItem.do")
	public String toAddItem(Model model) {
		// 查询所有品牌
		List<EbBrand> bList = brandService.selectBrand();
		model.addAttribute("bList", bList);
		// 查询商品的普通属性
		List<EbFeature> commList = featureService.selectCommFeature();
		model.addAttribute("commList", commList);
		// 查询商品的特殊属性
		List<EbFeature> specList = featureService.selectSpecFeature();
		model.addAttribute("specList", specList);
		return "item/addItem";
	}

	@RequestMapping("/addItem.do")
	public String addItem(EbItem item, EbItemClob itemClob,
			HttpServletRequest request, Integer divNum) {
		item.setItemNo(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		// 获取商品的普通属性
		List<EbFeature> commList = featureService.selectCommFeature();
		List<EbParaValue> paraList = new ArrayList<EbParaValue>();
		for (EbFeature ebFeature : commList) {
			Long featureId = ebFeature.getFeatureId();
			if (ebFeature.getInputType() == 3) {
				String[] paraArr = request.getParameterValues(featureId + "");
				if (paraArr != null && paraArr.length > 0) {
					String paraValue = "";
					for (String para : paraArr) {
						paraValue += para + ",";
					}
					paraValue = paraValue.substring(0, paraValue.length() - 1);
					EbParaValue ebParaValue = new EbParaValue();
					ebParaValue.setFeatureId(featureId);
					ebParaValue.setParaValue(paraValue);
					paraList.add(ebParaValue);
				}
			} else {
				String paraValue = request.getParameter(featureId + "");
				EbParaValue ebParaValue = new EbParaValue();
				ebParaValue.setFeatureId(featureId);
				ebParaValue.setParaValue(paraValue);
				paraList.add(ebParaValue);
			}
		}
		List<EbSku> skuList = new ArrayList<EbSku>();
		List<EbFeature> specList = featureService.selectSpecFeature();
		// skuType1 showStatus1 sort1 skuPrice1 marketPrice1 stockInventory1
		// skuUpperLimit1 sku1 location1
		// 遍历div数量
		for (int i = 1; i <= divNum; i++) {
			// 获得商城价和库存，他们是必填的字段
			String skuPrice = request.getParameter("skuPrice" + i);
			String stock = request.getParameter("stockInventory" + i);
			// 如果上面的必填字段不是空说明数据有效
			if (StringUtils.isNotBlank(skuPrice)
					&& StringUtils.isNotBlank(stock)) {
				String skuType = request.getParameter("skuType" + i);
				String showStatus = request.getParameter("showStatus" + i);
				String sort = request.getParameter("sort" + i);
				String marketPrice = request.getParameter("marketPrice" + i);
				String skuUpperLimit = request
						.getParameter("skuUpperLimit" + i);
				String sku = request.getParameter("sku" + i);
				String location = request.getParameter("location" + i);
				// 创建最小销售单元的对象，并且赋值
				EbSku skuObj = new EbSku();
				skuObj.setSkuPrice(new BigDecimal(skuPrice));
				skuObj.setStockInventory(new Integer(stock));
				if (StringUtils.isNotBlank(skuType)
						&& !StringUtils.equals(skuType, "")) {
					skuObj.setSkuType(new Short(skuType));
				}
				if (StringUtils.isNotBlank(showStatus)
						&& !StringUtils.equals(showStatus, "")) {
					skuObj.setShowStatus(new Short(showStatus));
				}
				if (StringUtils.isNotBlank(sort)
						&& !StringUtils.equals(sort, "")) {
					skuObj.setSkuSort(new Integer(sort));
				}
				if (StringUtils.isNotBlank(marketPrice)
						&& !StringUtils.equals(marketPrice, "")) {
					skuObj.setMarketPrice(new BigDecimal(marketPrice));
				}
				if (StringUtils.isNotBlank(skuUpperLimit)
						&& !StringUtils.equals(skuUpperLimit, "")) {
					skuObj.setSkuUpperLimit(new Integer(skuUpperLimit));
				}
				skuObj.setSku(sku);
				skuObj.setLocation(location);

				List<EbSpecValue> specValList = new ArrayList<EbSpecValue>();
				// 获得每个最小销售单元所拥有的规格属性值，
				// 遍历规格属性
				for (EbFeature feature : specList) {
					Long featureId = feature.getFeatureId();
					// 获得所选规格属性的值
					String specVal = request.getParameter(featureId
							+ "specradio" + i);
					// 创建规格对象
					EbSpecValue spec = new EbSpecValue();
					spec.setFeatureId(featureId);
					spec.setSpecValue(specVal);
					specValList.add(spec);
				}
				skuObj.setSpecList(specValList);
				skuList.add(skuObj);
			}

		}
		itemService.saveItem(item, itemClob, paraList, skuList);
		return "redirect:listItem.do?showStatus=1&auditStatus=1";
	}

	/**
	 * 列出审核列表
	 * @param qc 查询条件
	 * @param model
	 * @return
	 */
	@RequestMapping("/listAudit.do")
	public String listAudit(QueryCondition qc, Model model){
		if (qc.getPageNo() == null) {
			qc.setPageNo(1);
		}
		// 查询所有品牌
		List<EbBrand> bList = brandService.selectBrand();
		model.addAttribute("bList", bList);
		// 根据条件查询商品
		Page page = itemService.selectItemByCondition(qc);
		model.addAttribute("page", page);
		model.addAttribute("qc", qc);
		return "item/listAudit";
	}
	
	/**
	 * 审核商品
	 * @param itemId 商品id
	 * @param notes 审核信息
	 * @param auditStatus 审核状态
	 * @return
	 */
	@RequestMapping("/auditItem.do")
	public String auditItem(Long itemId, String notes, short auditStatus){
		itemService.auditItem(itemId, notes, auditStatus);
		return "redirect:listAudit.do?auditStatus=0&showStatus=1";
	}

	/**
	 * 上架商品
	 * @param itemId 商品id
	 * @param showStatus 上架状态
	 * @return
	 */
	@RequestMapping("/showItem.do")
	public String showItem(Long itemId, short showStatus){
		itemService.showItem(itemId, showStatus);
		return "redirect:listItem.do?showStatus=1&auditStatus=1";
	}
	
	/**
	 * 后台通过webService调用前台发布商品
	 * @param itemId 商品id
	 * @param response 
	 */
	@RequestMapping("/publishItem.do")
	public void publishItem(Long itemId, HttpServletResponse response){
		String password = ECPSUtils.readProp("pass_code");
		String result = itemService.publishItem(itemId, password);
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
