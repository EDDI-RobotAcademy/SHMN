package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.GoodsBoardReplyVO;

@Repository
public class GoodsBoardReplyDAOImpl implements GoodsBoardReplyDAO {
   
   @Inject SqlSession sql;

   //댓글 조회
   @Override
   public List<GoodsBoardReplyVO> readReply(int bno) throws Exception {
      return sql.selectList("goodsBoardReplyMapper.readReply",bno);
   }

   //댓글 작성
   @Override
   public void writeReply(GoodsBoardReplyVO vo) throws Exception {
      sql.insert("goodsBoardReplyMapper.writeReply",vo);

   }

   //댓글 수정
   @Override
   public void updateReply(GoodsBoardReplyVO vo) throws Exception {
      sql.update("goodsBoardReplyMapper.updateReply",vo);

   }

   //댓글 삭제
   @Override
   public void deleteReply(GoodsBoardReplyVO vo) throws Exception {
      sql.delete("goodsBoardReplyMapper.deleteReply",vo);

   }

   //선택된 댓글 조회
   @Override
   public GoodsBoardReplyVO selectReply(int rno) throws Exception {
      return sql.selectOne("goodsBoardReplyMapper.selectReply",rno);
   }

}