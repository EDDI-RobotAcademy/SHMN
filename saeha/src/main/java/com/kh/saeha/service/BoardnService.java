package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.BoardnVO;
public interface BoardnService {
	
	//공지게시판 목록 조회
	public List<BoardnVO> nlist() throws Exception;
	
	//공지게시판 글 등록
	public void nwrite(BoardnVO boardnVO) throws Exception;

	//공지게시판 상세보기
	public BoardnVO nread(int n_bno) throws Exception;

	//공지게시판 글 수정
	public void nupdate(BoardnVO boardnVO) throws Exception;
	
	//공지게시판 글 삭제
	public void ndelete(int n_bno) throws Exception;
	
	//공지게시판 조회수
	public BoardnVO nhit(int n_bno) throws Exception; 

}
