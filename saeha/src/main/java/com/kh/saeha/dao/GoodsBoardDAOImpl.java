package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class GoodsBoardDAOImpl implements GoodsBoardDAO {

	@Inject
	private SqlSession sqlSession;

	// 게시글 작성
	@Override
	public void write(GoodsBoardVO boardVO) throws Exception {
		sqlSession.insert("goodsBoardMapper.write", boardVO);

	}

	// 게시물 목록
	@Override
	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("goodsBoardMapper.listPage", scri);
	}

	/*
	 * selectList = 쿼리 결과 List<E>로 반환 결과가 없을 때에는 빈 List를 반환(Null을 반환하지 않는다.)
	 */

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("goodsBoardMapper.listCount", scri);
	}

	/*
	 * selectOne = 쿼리 결과가 없으면 Null 값을 반환 쿼리 결과로 레코드 하나만 가져온다. 다수 레코드가 있을 때
	 * TooManyResultException 발생
	 */

	// 게시물 조회
	@Override
	public GoodsBoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("goodsBoardMapper.read", bno);
	}

	// 게시물 수정
	@Override
	public void update(GoodsBoardVO boardVO) throws Exception {
		sqlSession.update("goodsBoardMapper.update", boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("goodsBoardMapper.delete", bno);
	}

	@Override
	public double devideCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("goodsBoardMapper.devideCount", scri);
	}
}
