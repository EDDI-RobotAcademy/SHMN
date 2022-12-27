package com.kh.saeha.vo;

public class SearchCriteria extends Criteria {

	private String searchType = "";
	private String keyword = "";
	private String pno = "";
	private Integer score = null;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", pno=" + pno + ", score=" + score
				+ "]";
	}

}
