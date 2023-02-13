package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.FaqVO;

public interface FaqService {

	//목록
	public List<FaqVO> list() throws Exception;
	
	//작성
	public void insert(FaqVO faqVO) throws Exception;

	//조회
	public FaqVO read(int faq_bno) throws Exception;

	// 게시물 수정
	public void update(FaqVO faqVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int faq_bno) throws Exception;

}
