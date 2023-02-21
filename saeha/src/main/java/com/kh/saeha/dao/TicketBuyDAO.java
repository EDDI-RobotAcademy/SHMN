package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.TicketBuyVO;

public interface TicketBuyDAO {

	public void insert(TicketBuyVO vo) throws Exception;
	
	public List<TicketBuyVO> booklist(String bt_id) throws Exception;
	
	// 예약 삭제
	public void delete(int bt_bno) throws Exception;
	
	// 예약 전체 삭제
	public void alldelete(String bt_id) throws Exception;
}
