package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.PdReplyVO;
public interface PdReplyDAO {
	
	//댓글 조회
	public List<PdReplyVO> readReply(int py_bno) throws Exception;
	
	//댓글 작성
	public void writeReply(PdReplyVO vo) throws Exception;	
	
	//댓글 수정
	public void updateReply(PdReplyVO vo) throws Exception;
		
	//댓글 삭제
	public void deleteReply(PdReplyVO vo) throws Exception;
	
	//선택 된 댓글 조회
	public PdReplyVO selectReply(int py_pno) throws Exception;
		

}
