package com.kh.saeha.vo;

public class ImgVO {
	
	private int ino;
	private int itotal;
	private String ipath;
	private int bno;
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getItotal() {
		return itotal;
	}
	public void setItotal(int itotal) {
		this.itotal = itotal;
	}
	public String getIpath() {
		return ipath;
	}
	public void setIpath(String ipath) {
		this.ipath = ipath;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return "ImgVO [ino=" + ino + ", itotal=" + itotal + ", ipath=" + ipath + ", bno=" + bno + "]";
	}
	
}
