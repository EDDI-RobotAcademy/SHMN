package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.BuyVO;
import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

public interface BuyDAO {
	
	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	public ProductVO buylist(int pd_bno) throws Exception;
	
	// 구매테이블에 입력
	public void buywrite(BuyVO buyVO) throws Exception;
	
	// 장바구니를 구매테이블에 입력
	public void cartwrite(BuyVO buyVO) throws Exception;
	
	// 구매시 장바구니 삭제
	public void cartdelete(CartVO cartVO) throws Exception;
	
	// 사용자 구매 리스트 카운트
	public int buylistCount(String user_id) throws Exception;
	
	// 사용자 구매 리스트
	public List<BuyVO> getlist(SearchCriteria scri) throws Exception;


}
