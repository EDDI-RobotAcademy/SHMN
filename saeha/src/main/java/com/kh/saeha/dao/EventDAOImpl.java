package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(EventVO eventvo) {
		sqlSession.insert("eventMapper.write",eventvo );
	}

	// 게시글 삭제
	@Override
	public void delete(int et_bno) {
		sqlSession.delete("eventMapper.delete", et_bno);
	}

	// 게시글 상세보기
	@Override
	public EventVO read(int et_bno) {
		return sqlSession.selectOne("eventMapper.read", et_bno);
	}

	// 사진 투표하기
	@Override
	public void vote(EventVO eventvo) {
		sqlSession.update("eventMapper.vote", eventvo);
	}

	// 게시글 불러오기(최신순)
	@Override
	public List<EventVO> recently() {
		return sqlSession.selectList("eventMapper.recently");
	}
	
	// 게시글 불러오기(투표순)
	@Override
	public List<EventVO> popular() {
		return sqlSession.selectList("eventMapper.popular");
	}

	// 해당 id 확인하기
	@Override
	public EventVO check(String et_memberid) {
		return sqlSession.selectOne("eventMapper.check", et_memberid);
	}

}
