package com.kh.saeha.vo;

public class CouponVO {

	private String bno;
	private String id;
	private String name;
	private String termStart;
	private String termEnd;
	private String termNow;
	private String price;
	private String percent;
	private String type;
	private String product;
	private String content;
	private String use;
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTermStart() {
		return termStart;
	}
	public void setTermStart(String termStart) {
		this.termStart = termStart;
	}
	public String getTermEnd() {
		return termEnd;
	}
	public void setTermEnd(String termEnd) {
		this.termEnd = termEnd;
	}
	public String getTermNow() {
		return termNow;
	}
	public void setTermNow(String termNow) {
		this.termNow = termNow;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	
	
	@Override
	public String toString() {
		return "CouponVO [bno=" + bno + ", id=" + id + ", name=" + name + ", termStart=" + termStart + ", termEnd="
				+ termEnd + ", termNow=" + termNow + ", price=" + price + ", percent=" + percent + ", type=" + type
				+ ", product=" + product + ", content=" + content + ", use=" + use + "]";
	}

	
}
