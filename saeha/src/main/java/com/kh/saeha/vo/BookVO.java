package com.kh.saeha.vo;

import java.util.Date;

public class BookVO {

	private int bk_bno; // 뷰로부터 받아올 값
	private int bk_pno; // 뷰로부터 받아올 값(프로그램 번호)
	private int bk_inwon; // view에서 받아올 값
	private String bk_id; // DB에서 받아올 값
	private Date bk_date; // view에서 받아올 값(예약한 날짜)
	private String bk_pdate; // view에서 받아올 값
	private String bk_time; // view에서 받아올 값
	private String bk_name; // view에서 받아올 값
	private String bk_tel; // view에서 받아올 값
	private String bk_type;
	private String pg_name;
	private int pg_bno;
	
	public int getBk_bno() {
		return bk_bno;
	}
	public void setBk_bno(int bk_bno) {
		this.bk_bno = bk_bno;
	}
	public int getBk_pno() {
		return bk_pno;
	}
	public void setBk_pno(int bk_pno) {
		this.bk_pno = bk_pno;
	}
	public int getBk_inwon() {
		return bk_inwon;
	}
	public void setBk_inwon(int bk_inwon) {
		this.bk_inwon = bk_inwon;
	}
	public String getBk_id() {
		return bk_id;
	}
	public void setBk_id(String bk_id) {
		this.bk_id = bk_id;
	}
	public Date getBk_date() {
		return bk_date;
	}
	public void setBk_date(Date bk_date) {
		this.bk_date = bk_date;
	}
	public String getBk_pdate() {
		return bk_pdate;
	}
	public void setBk_pdate(String bk_pdate) {
		this.bk_pdate = bk_pdate;
	}
	public String getBk_time() {
		return bk_time;
	}
	public void setBk_time(String bk_time) {
		this.bk_time = bk_time;
	}
	public String getBk_name() {
		return bk_name;
	}
	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}
	public String getBk_tel() {
		return bk_tel;
	}
	public void setBk_tel(String bk_tel) {
		this.bk_tel = bk_tel;
	}
	public String getBk_type() {
		return bk_type;
	}
	public void setBk_type(String bk_type) {
		this.bk_type = bk_type;
	}
	public String getPg_name() {
		return pg_name;
	}
	public void setPg_name(String pg_name) {
		this.pg_name = pg_name;
	}
	public int getPg_bno() {
		return pg_bno;
	}
	public void setPg_bno(int pg_bno) {
		this.pg_bno = pg_bno;
	}
	
	@Override
	public String toString() {
		return "BookVO [bk_bno=" + bk_bno + ", bk_pno=" + bk_pno + ", bk_inwon=" + bk_inwon + ", bk_id=" + bk_id
				+ ", bk_date=" + bk_date + ", bk_pdate=" + bk_pdate + ", bk_time=" + bk_time + ", bk_name=" + bk_name
				+ ", bk_tel=" + bk_tel + ", bk_type=" + bk_type + ", pg_name=" + pg_name + ", pg_bno=" + pg_bno + "]";
	}	
	
}
