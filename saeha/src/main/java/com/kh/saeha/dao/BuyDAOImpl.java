package com.kh.saeha.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.ProductVO;

@Repository
public class BuyDAOImpl implements BuyDAO {
	
	@Inject 
	private SqlSession sqlsession;

	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	@Override
	public ProductVO buylist(int pd_bno) throws Exception {
		
		return sqlsession.selectOne("buyMapper.buylist", pd_bno);
	}
}
