package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.EventVO;

public interface EventDAO {

	// public resultType id (parameterType);
	// 게시글 작성
	public void write (EventVO eventvo);
	
	// 게시글 삭제
	public void delete (int et_bno);
	
	// 게시글 상세보기
	public EventVO read (int et_bno);
	
	// 사진 투표하기
	public void vote (EventVO eventvo);
	
	// 게시글 불러오기(최신순)
	public List<EventVO> recently ();
	
	// 게시글 불러오기(투표순)
	public List<EventVO> popular ();
	
	// 해당 id 확인하기
	public EventVO check (String et_memberid);
}
