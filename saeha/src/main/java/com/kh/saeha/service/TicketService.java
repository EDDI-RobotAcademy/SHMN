package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketVO;

public interface TicketService {
	
	
	public List<TicketVO> list(SearchCriteria scri) throws Exception;

	public void insert(TicketVO vo) throws Exception;
	
	public void update(TicketVO vo) throws Exception;
	
	public void stockupdate(TicketVO vo) throws Exception;
	
	public void delete(int tk_bno) throws Exception;
	
	public TicketVO read(int tk_bno) throws Exception;
	
	public List<TicketVO> sday(String date) throws Exception;
}
