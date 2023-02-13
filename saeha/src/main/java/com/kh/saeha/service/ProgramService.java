package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

public interface ProgramService {
	
	//프로그램 등록
	public void upload(ProgramVO vo) throws Exception;
	
	//프로그램 수정
	public void programUpdate(ProgramVO vo) throws Exception;
	
	//프로그램 삭제
	public void programDelete(int bno) throws Exception;

	//프로그램 조회
	public ProgramVO programread(int bno) throws Exception;
	
	//프로그램 목록 조회
	public List<ProgramVO> programlist(String type) throws Exception;
	
	//프로그램 총 갯수
	public int plistCount(SearchCriteria scri) throws Exception;
	
	//예약 페이지
	public ProgramVO bookview(int bno) throws Exception;
	

}
