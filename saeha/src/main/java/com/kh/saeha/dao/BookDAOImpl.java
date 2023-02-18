package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject SqlSession sql;

	@Override
	public int book(BookVO vo) throws Exception {
		sql.insert("bookMapper.book", vo);
		return vo.getBk_bno();
	}

	@Override
	public void bookDelete(BookVO vo) throws Exception {
		sql.delete("bookMapper.bookDelete",vo);
	}

	@Override
	public void bookUpdate(BookVO vo) throws Exception {
		sql.update("bookMapper.bookUpdate",vo);
	}

	@Override
	public BookVO bookread(int bno) throws Exception {
		return sql.selectOne("bookMapper.bookread",bno);
	}

	@Override
	public ProgramVO bookinfo(int pg_bno) throws Exception {
		return sql.selectOne("bookMapper.bookinfo",pg_bno);
	}

	@Override
	public List<BookVO> booklist(BookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("bookMapper.booklist",vo);
	}


}
