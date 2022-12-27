package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.GoodsBoardReplyDAO;
import com.kh.saeha.vo.GoodsBoardReplyVO;

@Service
public class GoodsBoardReplyServiceImpl implements GoodsBoardReplyService {
   
   @Inject
   private GoodsBoardReplyDAO dao;
   

   //댓글 목록
   @Override
   public List<GoodsBoardReplyVO> readReply(int bno) throws Exception {
      return dao.readReply(bno);
   }

   //댓글 작성
   @Override
   public void writeReply(GoodsBoardReplyVO vo) throws Exception {
      dao.writeReply(vo);
      
   }

   //댓글 수정
   @Override
   public void updateReply(GoodsBoardReplyVO vo) throws Exception {
      dao.updateReply(vo);
      
   }

   //댓글 삭제
   @Override
   public void deleteReply(GoodsBoardReplyVO vo) throws Exception {
      dao.deleteReply(vo);
      
   }

   //선택된 댓글 조회
   @Override
   public GoodsBoardReplyVO selectReply(int rno) throws Exception {
      return dao.selectReply(rno);
   }

}