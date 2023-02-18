package com.kh.saeha.vo;

public class LikeVO {
	
	private int lk_bno;
	private int lk_pno;
	private String lk_id;
	private int lkcount;
	
	public int getLk_bno() {
		return lk_bno;
	}
	public void setLk_bno(int lk_bno) {
		this.lk_bno = lk_bno;
	}
	public int getLk_pno() {
		return lk_pno;
	}
	public void setLk_pno(int lk_pno) {
		this.lk_pno = lk_pno;
	}
	public String getLk_id() {
		return lk_id;
	}
	public void setLk_id(String lk_id) {
		this.lk_id = lk_id;
	}
	public int getLkcount() {
		return lkcount;
	}
	public void setLkcount(int lkcount) {
		this.lkcount = lkcount;
	}
	
	@Override
	public String toString() {
		return "LikeVO [lk_bno=" + lk_bno + ", lk_pno=" + lk_pno + ", lk_id=" + lk_id + ", lkcount=" + lkcount + "]";
	}

}
