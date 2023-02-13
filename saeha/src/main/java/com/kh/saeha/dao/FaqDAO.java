package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.FaqVO;

public interface FaqDAO {

	//글 목록 
	public List<FaqVO> list() throws Exception;
	
	//글 작성
	public void insert(FaqVO faqVO) throws Exception;
	
	//글 조회
	public FaqVO read(int faq_bno) throws Exception;
	
	//게시글 수정
	public void update(FaqVO faqvo) throws Exception;
	 
	//게시글 삭제
	public void delete(int faq_bno) throws Exception;
	
}
