package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.TicketBuyDAO;
import com.kh.saeha.vo.TicketBuyVO;

@Service
public class TicketBuyServiceImpl implements TicketBuyService {

	@Inject
	private TicketBuyDAO dao;
	
	@Override
	public void insert(TicketBuyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}
/*
	@Override
	public List<TicketBuyVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
*/
}
