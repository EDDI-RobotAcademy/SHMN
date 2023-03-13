package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.BoardnDAO;
import com.kh.saeha.vo.BoardnVO;


@Service 
public class BoardnServiceImpl implements BoardnService{
	
	@Inject
	private BoardnDAO dao;

	//공지게시판 목록 조회
	@Override
	public List<BoardnVO> nlist() throws Exception {
		return dao.nlist();
	}
	
	//공지게시판 게시글 등록
	@Override
	public void nwrite(BoardnVO boardnVO) throws Exception {
		dao.nwrite(boardnVO);
		
	}
	
	//공지게시판 상세보기
	@Override
	public BoardnVO nread(int n_bno) throws Exception {
		return dao.nread(n_bno);
		}
	
	//공지게판 글 수정
	@Override
	public void nupdate(BoardnVO boardnVO) throws Exception {
		dao.nupdate(boardnVO);
	}
	
	//공지게시판 글 삭제
	@Override
	public void ndelete(int n_bno) throws Exception {
		dao.ndelete(n_bno);
	}
	
	//공지게시판 조회수 
	@Override
	public BoardnVO nhit(int n_bno) throws Exception {
		return dao.nhit(n_bno);
			
	}

}
