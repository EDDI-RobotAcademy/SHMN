package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.TicketBuyVO;

@Repository
public class TicketBuyDAOImpl implements TicketBuyDAO {

	@Inject SqlSession sqlSession;
	private static String namespace = "ticketBuyMapper";
	
	//구매 (예약)
	@Override
	public void insert(TicketBuyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insert", vo);

	}

	// 예약 리스트
	@Override
	public List<TicketBuyVO> booklist(String bt_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".booklist", bt_id);
	}

	@Override
	public void delete(int bt_bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", bt_bno);
	}

	@Override
	public void alldelete(String bt_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".alldelete", bt_id);
	}

}
