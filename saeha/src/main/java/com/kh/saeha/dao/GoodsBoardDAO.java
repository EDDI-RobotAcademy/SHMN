package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.SearchCriteria;

public interface GoodsBoardDAO {
	
	public void write(GoodsBoardVO boardVO) throws Exception;

	public List<GoodsBoardVO> list(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

	public GoodsBoardVO read(int bno) throws Exception;

	public void update(GoodsBoardVO boardVO) throws Exception;

	public void delete(int bno) throws Exception;
	
	public double devideCount(SearchCriteria scri) throws Exception;
	
}
