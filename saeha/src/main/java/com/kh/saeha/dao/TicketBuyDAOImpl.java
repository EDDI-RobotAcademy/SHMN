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
	
	@Override
	public void insert(TicketBuyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insert", vo);

	}
/*
	@Override
	public List<TicketBuyVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".booklist");
	}
*/
}
