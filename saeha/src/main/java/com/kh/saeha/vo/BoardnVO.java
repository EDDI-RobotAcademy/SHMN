package com.kh.saeha.vo;

import java.sql.Date;

//SQL> create table sae_boardn(
//2  n_bno number PRIMARY KEY,
//3  n_title varchar2(150) not null,
//4  n_content varchar2(4000) not null,
//5  n_regdate date default sysdate,
//6  n_file varchar2(300));

public class BoardnVO {
	
	private int n_bno;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private String n_file;
	
	public int getN_bno() {
		return n_bno;
	}
	public void setN_bno(int n_bno) {
		this.n_bno = n_bno;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_file() {
		return n_file;
	}
	public void setN_file(String n_file) {
		this.n_file = n_file;
	}
	
	@Override
	public String toString() {
		return "BoardnVO [n_bno=" + n_bno + ", n_title=" + n_title + ", n_content=" + n_content + ", n_regdate="
				+ n_regdate + ", n_file=" + n_file + "]";
	}
	
	

}
