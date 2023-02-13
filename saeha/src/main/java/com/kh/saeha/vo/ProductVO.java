package com.kh.saeha.vo;

import java.util.Date;

public class ProductVO {
	
	private int pd_bno;
	private String pd_type;
	private String pd_name;
	private String pd_content;
	private String pd_thumbnail;
	private int pd_price;
	private int pd_stock;
	private int pd_readcount;
	private int pd_buycount;
	private int pd_file;
	private Date pd_date;
	private String p_filepath;
	private int pd_number;
	
	
	public int getPd_number() {
		return pd_number;
	}
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	public int getPd_bno() {
		return pd_bno;
	}
	public void setPd_bno(int pd_bno) {
		this.pd_bno = pd_bno;
	}
	public String getPd_type() {
		return pd_type;
	}
	public void setPd_type(String pd_type) {
		this.pd_type = pd_type;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public String getPd_thumbnail() {
		return pd_thumbnail;
	}
	public void setPd_thumbnail(String pd_thumbnail) {
		this.pd_thumbnail = pd_thumbnail;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_stock() {
		return pd_stock;
	}
	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}
	public int getPd_readcount() {
		return pd_readcount;
	}
	public void setPd_readcount(int pd_readcount) {
		this.pd_readcount = pd_readcount;
	}
	public int getPd_buycount() {
		return pd_buycount;
	}
	public void setPd_buycount(int pd_buycount) {
		this.pd_buycount = pd_buycount;
	}
	public int getPd_file() {
		return pd_file;
	}
	public void setPd_file(int pd_file) {
		this.pd_file = pd_file;
	}
	public Date getPd_date() {
		return pd_date;
	}
	public void setPd_date(Date pd_date) {
		this.pd_date = pd_date;
	}
	public String getP_filepath() {
		return p_filepath;
	}
	public void setP_filepath(String p_filepath) {
		this.p_filepath = p_filepath;
	}
	@Override
	public String toString() {
		return "ProductVO [pd_bno=" + pd_bno + ", pd_type=" + pd_type + ", pd_name=" + pd_name + ", pd_content="
				+ pd_content + ", pd_thumbnail=" + pd_thumbnail + ", pd_price=" + pd_price + ", pd_stock=" + pd_stock
				+ ", pd_readcount=" + pd_readcount + ", pd_buycount=" + pd_buycount + ", pd_file=" + pd_file
				+ ", pd_date=" + pd_date + ", p_filepath=" + p_filepath + ", pd_number=" + pd_number + "]";
	}
}
