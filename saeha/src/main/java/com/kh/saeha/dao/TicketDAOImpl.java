package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketVO;

@Repository
public class TicketDAOImpl implements TicketDAO {
	
	@Inject SqlSession sqlSession;
	private static String namespace = "ticketMapper";

	@Override
	public List<TicketVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}

	@Override
	public void insert(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public TicketVO read(int tk_bno) throws Exception {
		// TODO Auto-generated method stub
		return 	sqlSession.selectOne(namespace + ".read", tk_bno);

	}

	@Override
	public void update(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int tk_bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", tk_bno);

	}

	@Override
	public List<TicketVO> sday(String date) throws Exception {
		// TODO Auto-generated method stub
		return 	sqlSession.selectList(namespace + ".sday", date);	
		}

	@Override
	public void stockupdate(TicketVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".stockupdate", vo);
	}

	
}
