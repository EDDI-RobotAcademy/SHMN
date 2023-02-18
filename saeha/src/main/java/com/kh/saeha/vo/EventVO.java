package com.kh.saeha.vo;

public class EventVO {

	private int et_bno;
	private String et_title;
	private String et_writer;
	private String et_memberid;
	private String et_content;
	private int et_vote;
	private String et_file;
	
	public int getEt_bno() {
		return et_bno;
	}
	public void setEt_bno(int et_bno) {
		this.et_bno = et_bno;
	}
	public String getEt_title() {
		return et_title;
	}
	public void setEt_title(String et_title) {
		this.et_title = et_title;
	}
	public String getEt_writer() {
		return et_writer;
	}
	public void setEt_writer(String et_writer) {
		this.et_writer = et_writer;
	}
	public String getEt_memberid() {
		return et_memberid;
	}
	public void setEt_memberid(String et_memberid) {
		this.et_memberid = et_memberid;
	}
	public String getEt_content() {
		return et_content;
	}
	public void setEt_content(String et_content) {
		this.et_content = et_content;
	}
	public int getEt_vote() {
		return et_vote;
	}
	public void setEt_vote(int et_vote) {
		this.et_vote = et_vote;
	}
	public String getEt_file() {
		return et_file;
	}
	public void setEt_file(String et_file) {
		this.et_file = et_file;
	}
	
	@Override
	public String toString() {
		return "EventVO [et_bno=" + et_bno + ", et_title=" + et_title + ", et_writer=" + et_writer + ", et_memberid="
				+ et_memberid + ", et_content=" + et_content + ", et_vote=" + et_vote + ", et_file=" + et_file + "]";
	}
	
	
}
