package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.EventVO;

public interface EventService {

	// 게시글 작성
	public void write (EventVO eventvo)throws Exception;
	
	// 게시글 삭제
	public void delete (int et_bno)throws Exception;
	
	// 게시글 상세보기
	public EventVO read (int et_bno)throws Exception;
	
	// 사진 투표하기
	public void vote (EventVO eventvo)throws Exception;
	
	// 게시글 불러오기(최신순)
	public List<EventVO> recently () throws Exception;
	
	// 게시글 불러오기(투표순)
	public List<EventVO> popular () throws Exception;
	
	// 해당 id 확인하기
	public EventVO check (String et_memberid) throws Exception;
}
