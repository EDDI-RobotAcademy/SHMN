package com.kh.saeha.vo;

public class GoodsBoardReplyVO {

	private int geBno;
	private int geRno;
	private String geWriter;
	private String geContent;
	private String geDate;
	
	public int getGeBno() {
		return geBno;
	}
	public void setGeBno(int geBno) {
		this.geBno = geBno;
	}
	public int getGeRno() {
		return geRno;
	}
	public void setGeRno(int geRno) {
		this.geRno = geRno;
	}
	public String getGeWriter() {
		return geWriter;
	}
	public void setGeWriter(String geWriter) {
		this.geWriter = geWriter;
	}
	public String getGeContent() {
		return geContent;
	}
	public void setGeContent(String geContent) {
		this.geContent = geContent;
	}
	public String getGeDate() {
		return geDate;
	}
	public void setGeDate(String geDate) {
		this.geDate = geDate;
	}
	
	@Override
	public String toString() {
		return "GoodsBoardReplyVO [geBno=" + geBno + ", geRno=" + geRno + ", geWriter=" + geWriter + ", geContent="
				+ geContent + ", geDate=" + geDate + "]";
	}
	
	
}
