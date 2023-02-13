package com.kh.saeha.vo;

public class BuyVO {
	
	private int by_bno;
	private int by_pno;
	private int by_count;
	private String by_id;
	private int by_price;
	public int getBy_bno() {
		return by_bno;
	}
	public void setBy_bno(int by_bno) {
		this.by_bno = by_bno;
	}
	public int getBy_pno() {
		return by_pno;
	}
	public void setBy_pno(int by_pno) {
		this.by_pno = by_pno;
	}
	public int getBy_count() {
		return by_count;
	}
	public void setBy_count(int by_count) {
		this.by_count = by_count;
	}
	public String getBy_id() {
		return by_id;
	}
	public void setBy_id(String by_id) {
		this.by_id = by_id;
	}
	public int getBy_price() {
		return by_price;
	}
	public void setBy_price(int by_price) {
		this.by_price = by_price;
	}
	@Override
	public String toString() {
		return "BuyVO [by_bno=" + by_bno + ", by_pno=" + by_pno + ", by_count=" + by_count + ", by_id=" + by_id
				+ ", by_price=" + by_price + "]";
	}
	
	
}
