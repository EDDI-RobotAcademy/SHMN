package com.kh.saeha.vo;

public class LikelistVO {
	private int pg_bno;
	private String pg_name;
	private int pg_file;
	private int pg_stock;
	private String pg_startdate;
	private String pg_enddate;
	private String pg_bstartdate;
	private String pg_benddate;
	private String pg_type;
	private String lk_id;
	
	public int getPg_bno() {
		return pg_bno;
	}
	public void setPg_bno(int pg_bno) {
		this.pg_bno = pg_bno;
	}
	public String getPg_name() {
		return pg_name;
	}
	public void setPg_name(String pg_name) {
		this.pg_name = pg_name;
	}
	public int getPg_file() {
		return pg_file;
	}
	public void setPg_file(int pg_file) {
		this.pg_file = pg_file;
	}
	public int getPg_stock() {
		return pg_stock;
	}
	public void setPg_stock(int pg_stock) {
		this.pg_stock = pg_stock;
	}
	public String getPg_startdate() {
		return pg_startdate;
	}
	public void setPg_startdate(String pg_startdate) {
		this.pg_startdate = pg_startdate;
	}
	public String getPg_enddate() {
		return pg_enddate;
	}
	public void setPg_enddate(String pg_enddate) {
		this.pg_enddate = pg_enddate;
	}
	public String getPg_bstartdate() {
		return pg_bstartdate;
	}
	public void setPg_bstartdate(String pg_bstartdate) {
		this.pg_bstartdate = pg_bstartdate;
	}
	public String getPg_benddate() {
		return pg_benddate;
	}
	public void setPg_benddate(String pg_benddate) {
		this.pg_benddate = pg_benddate;
	}
	public String getPg_type() {
		return pg_type;
	}
	public void setPg_type(String pg_type) {
		this.pg_type = pg_type;
	}
	public String getLk_id() {
		return lk_id;
	}
	public void setLk_id(String lk_id) {
		this.lk_id = lk_id;
	}
	
	@Override
	public String toString() {
		return "LikelistVO [pg_bno=" + pg_bno + ", pg_name=" + pg_name + ", pg_file=" + pg_file + ", pg_stock="
				+ pg_stock + ", pg_startdate=" + pg_startdate + ", pg_enddate=" + pg_enddate + ", pg_bstartdate="
				+ pg_bstartdate + ", pg_benddate=" + pg_benddate + ", pg_type=" + pg_type + ", lk_id=" + lk_id + "]";
	}	

}
