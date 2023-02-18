package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketVO;

public interface TicketDAO {

		// 티켓 리스트
		public List<TicketVO> list(SearchCriteria scri) throws Exception;
		
		// 티켓 등록
		public void insert(TicketVO vo) throws Exception;
		
		//티켓 조회
		public TicketVO read(int tk_bno) throws Exception;
		
		//티켓 수정
		public void update(TicketVO vo) throws Exception;
			
		//티켓 삭제
		public void delete(int tk_bno) throws Exception;
		
		public List<TicketVO> sday(String date) throws Exception;
		
		public void stockupdate(TicketVO vo) throws Exception;
}
