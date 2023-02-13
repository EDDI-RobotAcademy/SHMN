package com.kh.saeha.vo;

public class FaqVO {

	private int faq_bno;
	private String faq_title;
	private String faq_content;
	
	
	public int getFaq_bno() {
		return faq_bno;
	}
	public void setFaq_bno(int faq_bno) {
		this.faq_bno = faq_bno;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faq_bno=" + faq_bno + ", faq_title=" + faq_title + ", faq_content=" + faq_content + "]";
	}
}
