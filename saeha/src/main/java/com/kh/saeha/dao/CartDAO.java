package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;

public interface CartDAO {
	
	// 장바구니 추가
	public void addcart(CartVO cartVO) throws Exception;
	
	// 장바구니 중복체크
	public int checkcart(ProductVO productVO) throws Exception;
	
	// 장바구니 리스트
	public List<CartVO> cartlist(String user_id) throws Exception;
	
	// 재고 수
	public int stock(CartVO cartVO) throws Exception;
	
	// 장바구니 삭제
	public void delete(CartVO cartVO) throws Exception;
	
	// 재고 0인 장바구니 삭제
	public void nonstock(int ct_pno) throws Exception;
	
}
