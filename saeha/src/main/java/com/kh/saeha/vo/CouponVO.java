package com.kh.saeha.vo;

public class CouponVO {

	private String  coupon_bno;
	private String coupon_id;
	private String coupon_name;
	private String coupon_termStart;
	private String coupon_termEnd;
	private String coupon_termNow;
	private String coupon_price;
	private String coupon_percent;
	private String coupon_type;
	private String coupon_product;
	private String coupon_content;
	public String getCoupon_bno() {
		return coupon_bno;
	}
	public void setCoupon_bno(String coupon_bno) {
		this.coupon_bno = coupon_bno;
	}
	public String getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_termStart() {
		return coupon_termStart;
	}
	public void setCoupon_termStart(String coupon_termStart) {
		this.coupon_termStart = coupon_termStart;
	}
	public String getCoupon_termEnd() {
		return coupon_termEnd;
	}
	public void setCoupon_termEnd(String coupon_termEnd) {
		this.coupon_termEnd = coupon_termEnd;
	}
	public String getCoupon_termNow() {
		return coupon_termNow;
	}
	public void setCoupon_termNow(String coupon_termNow) {
		this.coupon_termNow = coupon_termNow;
	}
	public String getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(String coupon_price) {
		this.coupon_price = coupon_price;
	}
	public String getCoupon_percent() {
		return coupon_percent;
	}
	public void setCoupon_percent(String coupon_percent) {
		this.coupon_percent = coupon_percent;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public String getCoupon_product() {
		return coupon_product;
	}
	public void setCoupon_product(String coupon_product) {
		this.coupon_product = coupon_product;
	}
	public String getCoupon_content() {
		return coupon_content;
	}
	public void setCoupon_content(String coupon_content) {
		this.coupon_content = coupon_content;
	}
	@Override
	public String toString() {
		return "CouponVO [coupon_bno=" + coupon_bno + ", coupon_id=" + coupon_id + ", coupon_name=" + coupon_name
				+ ", coupon_termStart=" + coupon_termStart + ", coupon_termEnd=" + coupon_termEnd + ", coupon_termNow="
				+ coupon_termNow + ", coupon_price=" + coupon_price + ", coupon_percent=" + coupon_percent
				+ ", coupon_type=" + coupon_type + ", coupon_product=" + coupon_product + ", coupon_content="
				+ coupon_content + "]";
	}
	

	
}
