package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.PdReplyDAO;
import com.kh.saeha.vo.PdReplyVO;
@Service
public class PdReplyServiceImpl implements PdReplyService{

	@Inject
	private PdReplyDAO dao;

	//댓글을 보여줌 목록
	@Override
	public List<PdReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(PdReplyVO vo) throws Exception {
		dao.writeReply(vo);
		
	}
	
	//댓글 수정
	@Override
	public void updateReply(PdReplyVO vo) throws Exception {
		dao.updateReply(vo);
		
	}
		
	//댓글 삭제
	@Override
	public void deleteReply(PdReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		
	}
	
	//선택된 댓글 조회
	@Override
	public PdReplyVO selectReply(int py_pno) throws Exception {
		return dao.selectReply(py_pno);
		}
}
