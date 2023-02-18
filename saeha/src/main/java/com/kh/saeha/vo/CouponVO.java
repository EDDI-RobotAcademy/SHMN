package com.kh.saeha.vo;

public class CouponVO {

	private int coupon_bno;
	private String coupon_id;
	private String coupon_name;
	private int coupon_price;
	private String coupon_content;
	
	public int getCoupon_bno() {
		return coupon_bno;
	}
	public void setCoupon_bno(int coupon_bno) {
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
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
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
				+ ", coupon_price=" + coupon_price + ", coupon_content=" + coupon_content + "]";
	}
	
	
	
}
