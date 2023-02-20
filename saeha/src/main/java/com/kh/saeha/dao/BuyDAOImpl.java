package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.BuyVO;
import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class BuyDAOImpl implements BuyDAO {
	
	@Inject 
	private SqlSession sqlsession;

	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	@Override
	public ProductVO buylist(int pd_bno) throws Exception {
		
		return sqlsession.selectOne("buyMapper.buylist", pd_bno);
	}

	@Override
	public void buywrite(BuyVO buyVO) throws Exception {
		
		sqlsession.insert("buyMapper.buywrite", buyVO);
	}
	
	// 장바구니를 구매테이블에 입력
	@Override
	public void cartwrite(BuyVO buyVO) throws Exception {
		
		for(int i = 0; i < buyVO.getBuyvolist().size(); i++) {
			sqlsession.insert("buyMapper.cartwrite", buyVO.getBuyvolist().get(i));
		}
		
	}
	
	// 삭제
	@Override
	public void cartdelete(CartVO cartVO) throws Exception {
		sqlsession.delete("buyMapper.cartdelete", cartVO);
	}

	// 사용자 구매 리스트 카운트
	@Override
	public int buylistCount(String user_id) throws Exception {
		return sqlsession.selectOne("buyMapper.buylistCount",user_id);
	}
	
	// 사용자 구매 리스트
	@Override
	public List<BuyVO> getlist(SearchCriteria scri) throws Exception {
		return sqlsession.selectList("buyMapper.getlist", scri);
	}

	
}
