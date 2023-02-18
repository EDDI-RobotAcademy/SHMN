package com.kh.saeha.vo;

public class TicketBuyVO {
/*
 *    bt_bno number primary key,
   bt_pno number,
   bt_price number,
   bt_count number,
   bt_id varchar2(50));
   
   
 */
	private int bt_pno;
	private int bt_price;
	private int bt_count;
	private String bt_id;
	
	
	private int bt_bno;
	public int getBt_bno() {
		return bt_bno;
	}
	public void setBt_bno(int bt_bno) {
		this.bt_bno = bt_bno;
	}
	public int getBt_pno() {
		return bt_pno;
	}
	public void setBt_pno(int bt_pno) {
		this.bt_pno = bt_pno;
	}
	public int getBt_price() {
		return bt_price;
	}
	public void setBt_price(int bt_price) {
		this.bt_price = bt_price;
	}
	public int getBt_count() {
		return bt_count;
	}
	public void setBt_count(int bt_count) {
		this.bt_count = bt_count;
	}
	public String getBt_id() {
		return bt_id;
	}
	public void setBt_id(String bt_id) {
		this.bt_id = bt_id;
	}
	
	@Override
	public String toString() {
		return "TicketBuyVO [bt_bno=" + bt_bno + ", bt_pno=" + bt_pno + ", bt_price=" + bt_price + ", bt_count="
				+ bt_count + ", bt_id=" + bt_id + "]";
	}
	
}
