package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.BuyDAO;
import com.kh.saeha.vo.BuyVO;
import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class BuyServiceImpl implements BuyService {

	@Inject
	private BuyDAO dao;
	
	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	@Override
	public ProductVO buylist(int pd_bno) throws Exception {
		return dao.buylist(pd_bno);
	}
	
	// 구매테이블에 입력
	@Override
	public void buywrite(BuyVO buyVO) throws Exception {
		dao.buywrite(buyVO);
	}
	
	// 장바구니를 구매테이블에 입력
	@Override
	public void cartwrite(BuyVO buyVO) throws Exception {
		dao.cartwrite(buyVO);
	}

	@Override
	public void cartdelete(CartVO cartVO) throws Exception {
		dao.cartdelete(cartVO);
	}
	
	// 사용자 구매 리스트 카운트
	@Override
	public int buylistCount(String user_id) throws Exception {
		return dao.buylistCount(user_id);
	}
	
	// 사용자 구매 리스트
	@Override
	public List<BuyVO> getlist(SearchCriteria scri) throws Exception {
		return dao.getlist(scri);
	}



}
