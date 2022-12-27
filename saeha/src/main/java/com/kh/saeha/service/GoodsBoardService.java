package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;


public interface GoodsBoardService {



	//게시글 작성
	public void write(GoodsBoardVO boardVO) throws Exception;
	
	//게시물 목록 조회
	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//게시물 조회
	public GoodsBoardVO read(int bno) throws Exception;
	
	//게시물 수정
	public void update(GoodsBoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;
	
	//총 평점 / 총 게시글 수
	public double devideCount(SearchCriteria scri) throws Exception;
}
