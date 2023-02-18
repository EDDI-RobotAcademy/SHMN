package com.kh.saeha.vo;

public class TicketVO {

	
	/*
	    tk_bno number primary key,
   		tk_name varchar2(300),
   		tk_price number,
   		tk_stock number,
   		tk_date date default sysdate);
	 */
	
	private int tk_bno;
	private String tk_name;
	private int tk_price;
	private int tk_stock;
	private String tk_date;
	
	@Override
	public String toString() {
		return "TicketVO [tk_bno=" + tk_bno + ", tk_name=" + tk_name + ", tk_price=" + tk_price + ", tk_stock="
				+ tk_stock + ", tk_date=" + tk_date + "]";
	}
	
	public int getTk_bno() {
		return tk_bno;
	}
	public void setTk_bno(int tk_bno) {
		this.tk_bno = tk_bno;
	}
	public String getTk_name() {
		return tk_name;
	}
	public void setTk_name(String tk_name) {
		this.tk_name = tk_name;
	}
	public int getTk_price() {
		return tk_price;
	}
	public void setTk_price(int tk_price) {
		this.tk_price = tk_price;
	}
	public int getTk_stock() {
		return tk_stock;
	}
	public void setTk_stock(int tk_stock) {
		this.tk_stock = tk_stock;
	}	
	public String getTk_date() {
		return tk_date;
	}
	public void setTk_date(String tk_date) {
		this.tk_date = tk_date;
	}	

}
