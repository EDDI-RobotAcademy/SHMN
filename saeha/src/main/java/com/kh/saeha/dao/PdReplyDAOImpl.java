package com.kh.saeha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.PdReplyVO;

@Repository
public class PdReplyDAOImpl implements PdReplyDAO{
	
	@Inject SqlSession sql;
	

	//댓글 조회
	@Override
	public List<PdReplyVO> readReply(int py_bno) throws Exception {
		return sql.selectList("pdreplyMapper.replyRead", py_bno);
		
	}
	
	//댓글 작성
	@Override
	public void writeReply(PdReplyVO vo) throws Exception {
		sql.update("pdreplyMapper.replyWrite", vo);
		
	}
	
	//댓글 수정
	@Override
	public void updateReply(PdReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}
		
	//댓글 삭제
	@Override
	public void deleteReply(PdReplyVO vo) throws Exception {
		sql.delete("pdreplyMapper.replyDelete", vo);
		
	}
	
	//선택 된 댓글 조회 
	//하나 만 받을때 selectOne
	@Override
	public PdReplyVO selectReply(int py_pno) throws Exception {
		return sql.selectOne("pdreplyMapper.selectReply", py_pno);
		}
		
}
