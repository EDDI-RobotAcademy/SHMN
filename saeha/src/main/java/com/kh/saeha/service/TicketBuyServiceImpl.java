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

	@Override
	public List<TicketBuyVO> booklist(String bt_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.booklist(bt_id);
	}

	@Override
	public void delete(int bt_bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bt_bno);
	}

	@Override
	public void alldelete(String bt_id) throws Exception {
		// TODO Auto-generated method stub
		dao.alldelete(bt_id);
		
	}

}
