package com.kh.saeha.service;

import java.util.List;


import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

public interface BookService {
	
	//예약할 정보 불러오기
	public ProgramVO bookinfo(int pg_bno) throws Exception;
	
	//예약하기
	public int book(BookVO vo) throws Exception;

	//예약취소
	public void bookDelete(int bno) throws Exception; 
	
	//예약변경
	public void bookUpdate(BookVO vo) throws Exception;
	
	//예약조회
	public BookVO bookread(int bno) throws Exception;
	
	//예약리스트 조회
	public List<BookVO> booklist(BookVO vo) throws Exception;
	
	

}
