package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.BoardnVO;

@Repository
public class BoardnDAOImpl implements BoardnDAO{
	
	@Inject
	private SqlSession sqlSession;

	//공지게시판 목록보기
	@Override
	public List<BoardnVO> nlist() throws Exception {
		
		return sqlSession.selectList("boardnMapper.nlist");
		//namespace + 쿼리 아이디명 nlist
	}
	// selectList = 쿼리결과 List<E>로 반환
	//결과가 없을 때에는 빈 List 를 반환 (Null을 반환하지 않는다)
	
	
	//공지게시판 글 작성
	@Override
	public void nwrite(BoardnVO boardnVO) throws Exception {
		
		sqlSession.insert("boardnMapper.insert", boardnVO);
	}
	
	//공지게시판 상세보기
	@Override
	public BoardnVO nread(int n_bno) throws Exception {
		return sqlSession.selectOne("boardnMapper.nread", n_bno);
	
	//selectOne = 쿼리 결과가 없으면 Null 반환
	//쿼리 결과로 레코드 하나만 가져온다
	//다수 레코드가 있을 때 TooManyResultException 발생
	}
	
	
	//공지게시판 글 수정
	@Override
	public void nupdate(BoardnVO boardnVO) throws Exception {
		sqlSession.update("boardnMapper.nupdate", boardnVO);
	}
	
	//공지게시판 게시물 삭제
	@Override
	public void ndelete(int n_bno) throws Exception {
		sqlSession.delete("boardnMapper.ndelete", n_bno);
	}
	
	//공지게시판 조회수
	@Override
	public BoardnVO nhit(int n_bno) throws Exception {
		return sqlSession.selectOne("boardnMapper.nhit", n_bno);
		}
	
	
}
