package com.kh.saeha.vo;

public class GoodsBoardVO {

	private int gwBno;
	private String gwPno;
	private String gwTitle;
	private String gwWriter;
	private String gwContent;
	private int gwScore;
	private String gwFile;
	private String gwDate;
	
	public int getGwBno() {
		return gwBno;
	}
	public void setGwBno(int gwBno) {
		this.gwBno = gwBno;
	}
	public String getGwPno() {
		return gwPno;
	}
	public void setGwPno(String gwPno) {
		this.gwPno = gwPno;
	}
	public String getGwTitle() {
		return gwTitle;
	}
	public void setGwTitle(String gwTitle) {
		this.gwTitle = gwTitle;
	}
	public String getGwWriter() {
		return gwWriter;
	}
	public void setGwWriter(String gwWriter) {
		this.gwWriter = gwWriter;
	}
	public String getGwContent() {
		return gwContent;
	}
	public void setGwContent(String gwContent) {
		this.gwContent = gwContent;
	}
	public int getGwScore() {
		return gwScore;
	}
	public void setGwScore(int gwScore) {
		this.gwScore = gwScore;
	}
	public String getGwFile() {
		return gwFile;
	}
	public void setGwFile(String gwFile) {
		this.gwFile = gwFile;
	}
	public String getGwDate() {
		return gwDate;
	}
	public void setGwDate(String gwDate) {
		this.gwDate = gwDate;
	}
	
	@Override
	public String toString() {
		return "GoodsBoardVO [gwBno=" + gwBno + ", gwPno=" + gwPno + ", gwTitle=" + gwTitle + ", gwWriter=" + gwWriter
				+ ", gwContent=" + gwContent + ", gwScore=" + gwScore + ", gwFile=" + gwFile + ", gwDate=" + gwDate
				+ "]";
	}
	
	
}
