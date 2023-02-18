package com.kh.saeha.vo;

public class GoodsBoardImgVO {

	private int rg_ino;
	private int rg_itotal;
	private String rg_ipath;
	private int rg_bno;
	
	public int getRg_ino() {
		return rg_ino;
	}
	public void setRg_ino(int rg_ino) {
		this.rg_ino = rg_ino;
	}
	public int getRg_itotal() {
		return rg_itotal;
	}
	public void setRg_itotal(int rg_itotal) {
		this.rg_itotal = rg_itotal;
	}
	public String getRg_ipath() {
		return rg_ipath;
	}
	public void setRg_ipath(String rg_ipath) {
		this.rg_ipath = rg_ipath;
	}
	public int getRg_bno() {
		return rg_bno;
	}
	public void setRg_bno(int rg_bno) {
		this.rg_bno = rg_bno;
	}
	
	@Override
	public String toString() {
		return "GoodsBoardImgVO [rg_ino=" + rg_ino + ", rg_itotal=" + rg_itotal + ", rg_ipath=" + rg_ipath + ", rg_bno="
				+ rg_bno + "]";
	}
	
	
}
