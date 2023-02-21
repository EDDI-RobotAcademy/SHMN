package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.TicketBuyVO;

public interface TicketBuyService {

	public void insert(TicketBuyVO vo) throws Exception;
	
	public List<TicketBuyVO> booklist(String bt_id) throws Exception;
	
	public void delete(int bt_bno) throws Exception;
	
	public void alldelete(String bt_id) throws Exception;
}
