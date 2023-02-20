package com.kh.saeha.vo;

import java.sql.Date;
import java.util.List;

public class BuyVO {
	
	private int by_bno;
	private int by_pno;
	private String by_name;
	private int by_count;
	private String by_id;
	private Date by_date;
	private int by_price;
	private String by_filepath;
	
	
	private List<BuyVO> buyvolist;
	
	public String getBy_filepath() {
		return by_filepath;
	}
	public void setBy_filepath(String by_filepath) {
		this.by_filepath = by_filepath;
	}
	public List<BuyVO> getBuyvolist() {
		return buyvolist;
	}
	public void setBuyvolist(List<BuyVO> buyvolist) {
		this.buyvolist = buyvolist;
	}
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
	public String getBy_name() {
		return by_name;
	}
	public void setBy_name(String by_name) {
		this.by_name = by_name;
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
	public Date getBy_date() {
		return by_date;
	}
	public void setBy_date(Date by_date) {
		this.by_date = by_date;
	}
	public int getBy_price() {
		return by_price;
	}
	public void setBy_price(int by_price) {
		this.by_price = by_price;
	}
	
	@Override
	public String toString() {
		return "BuyVO [by_bno=" + by_bno + ", by_pno=" + by_pno + ", by_name=" + by_name + ", by_count=" + by_count
				+ ", by_id=" + by_id + ", by_date=" + by_date + ", by_price=" + by_price + ", by_filepath="
				+ by_filepath + ", buyvolist=" + buyvolist + "]";
	}
}
