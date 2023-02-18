package com.kh.saeha.vo;

public class CartVO {
	
	private int ct_bno;
	private int ct_pno;
	private String ct_name;
	private String ct_id;
	private int ct_price;
	private int ct_count;
	private String p_filepath;
	private int ct_stock;
	public int getCt_bno() {
		return ct_bno;
	}
	public void setCt_bno(int ct_bno) {
		this.ct_bno = ct_bno;
	}
	public int getCt_pno() {
		return ct_pno;
	}
	public void setCt_pno(int ct_pno) {
		this.ct_pno = ct_pno;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_id() {
		return ct_id;
	}
	public void setCt_id(String ct_id) {
		this.ct_id = ct_id;
	}
	public int getCt_price() {
		return ct_price;
	}
	public void setCt_price(int ct_price) {
		this.ct_price = ct_price;
	}
	public int getCt_count() {
		return ct_count;
	}
	public void setCt_count(int ct_count) {
		this.ct_count = ct_count;
	}
	public String getP_filepath() {
		return p_filepath;
	}
	public void setP_filepath(String p_filepath) {
		this.p_filepath = p_filepath;
	}
	public int getCt_stock() {
		return ct_stock;
	}
	public void setCt_stock(int ct_stock) {
		this.ct_stock = ct_stock;
	}
	@Override
	public String toString() {
		return "CartVO [ct_bno=" + ct_bno + ", ct_pno=" + ct_pno + ", ct_name=" + ct_name + ", ct_id=" + ct_id
				+ ", ct_price=" + ct_price + ", ct_count=" + ct_count + ", p_filepath=" + p_filepath + ", ct_stock="
				+ ct_stock + "]";
	}
	
}
