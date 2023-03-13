package com.kh.saeha.service;

import java.util.List;
import java.util.Map;

import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

public interface ProgramService {

	// 프로그램 등록
	public void upload(ProgramVO vo) throws Exception;

	// 프로그램 수정
	public void programUpdate(ProgramVO vo) throws Exception;

	// 프로그램 삭제
	public void programDelete(int bno) throws Exception;

	// 프로그램 조회
	public ProgramVO programread(int bno) throws Exception;

	// 프로그램 목록 조회
	public List<ProgramVO> programlist(String type) throws Exception;

	// 프로그램 총 갯수
	public int plistCount(SearchCriteria scri) throws Exception;

	// 예약 페이지
	public ProgramVO bookview(int bno) throws Exception;

	// 이미지 저장
	public void pfileSave(Map<String, String> fileMap) throws Exception;

	// 이미지 관련 pg_bno 얻기
	public int programbno(ProgramVO vo) throws Exception;

	// 이미지 삭제(테이블)
	public void pidelete(int pg_bno) throws Exception;

	// pno에 해당하는 사진 경로 중 가장 먼저 올린 것 1개의 filePath 반환
	public String pgetImg(int pg_bno) throws Exception;

	// 프로그램 게시물 사진 얻어오기
	public List<ImgVO> pimglist(int pg_bno) throws Exception;

}
