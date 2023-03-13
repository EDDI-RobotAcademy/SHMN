package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.BookDAO;
import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;
@Service
public class BookServiceImpl implements BookService{
	
	@Inject
	BookDAO dao;

	@Override
	public int book(BookVO vo) throws Exception {
		return dao.book(vo);
	}

	@Override
	public void bookDelete(int bno) throws Exception {
		dao.bookDelete(bno);		
	}

	@Override
	public void bookUpdate(BookVO vo) throws Exception {
		dao.bookUpdate(vo);
	}
	
	

	@Override
	public List<BookVO> booklist(BookVO vo) throws Exception {
		return dao.booklist(vo);
	}
	
	@Override
	public BookVO bookread(int bno) throws Exception {
		return dao.bookread(bno);
	}

	@Override
	public ProgramVO bookinfo(int pg_bno) throws Exception {
		return dao.bookinfo(pg_bno);
	}
	
	

}
