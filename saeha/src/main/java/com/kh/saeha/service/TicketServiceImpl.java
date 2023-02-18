package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.TicketDAO;
import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketVO;

@Service
public class TicketServiceImpl implements TicketService {

	@Inject
	private TicketDAO dao;
	
	@Override
	public List<TicketVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	@Override
	public void insert(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public TicketVO read(int tk_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(tk_bno);
	}

	@Override
	public void update(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int tk_bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(tk_bno);
	}

	@Override
	public List<TicketVO> sday(String date) throws Exception {
		// TODO Auto-generated method stub
		return dao.sday(date);
	}

	@Override
	public void stockupdate(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.stockupdate(vo);
	}

}
