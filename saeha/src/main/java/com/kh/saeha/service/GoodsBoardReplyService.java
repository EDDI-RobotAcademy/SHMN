package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.GoodsBoardReplyVO;

public interface GoodsBoardReplyService {

	// 댓글 조회
	public List<GoodsBoardReplyVO> readReply(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(GoodsBoardReplyVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(GoodsBoardReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(GoodsBoardReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public GoodsBoardReplyVO selectReply(int rno) throws Exception;
}
