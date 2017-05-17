package com.sihai.ecps.model;

public class EbCart {
	
	private Long skuId;
	
	private Integer quantity;
	
	private EbSku sku;

	public Long getSkuId() {
		return skuId;
	}

	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public EbSku getSku() {
		return sku;
	}

	public void setSku(EbSku sku) {
		this.sku = sku;
	}
	
	
}
