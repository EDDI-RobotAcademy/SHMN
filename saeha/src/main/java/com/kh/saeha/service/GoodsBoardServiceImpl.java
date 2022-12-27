package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.saeha.dao.GoodsBoardDAO;
import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class GoodsBoardServiceImpl implements GoodsBoardService {


	@Inject GoodsBoardDAO dao;
	
	
	@Override
	public void write(GoodsBoardVO GoodsBoardVO) throws Exception {
		
		dao.write(GoodsBoardVO);
	}

	@Override
	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}

	@Override
	public GoodsBoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void update(GoodsBoardVO boardVO) throws Exception {
		
		dao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public double devideCount(SearchCriteria scri) throws Exception {
		return dao.devideCount(scri);
	}

}
