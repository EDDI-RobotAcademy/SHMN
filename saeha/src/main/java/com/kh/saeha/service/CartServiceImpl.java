package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.CartDAO;
import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO dao;
	
	//장바구니 추가
	@Override
	public void addcart(CartVO cartVO) throws Exception {
		
		dao.addcart(cartVO);
	}
	
	// 장바구니 중복 체크
	@Override
	public int checkcart(ProductVO productVO) throws Exception {
		
		return dao.checkcart(productVO);
	}
	
	// 장바구니 리스트
	@Override
	public List<CartVO> cartlist(String user_id) throws Exception {
		return dao.cartlist(user_id);
	}
	
	// 재고 수
	@Override
	public int stock(CartVO cartVO) throws Exception {
		
		return dao.stock(cartVO);
	}
	
	// 카트 삭제
	@Override
	public void delete(CartVO cartVO) throws Exception {
		
		dao.delete(cartVO);
		
	}

	@Override
	public void nonstock(int ct_pno) throws Exception {
		dao.nonstock(ct_pno);
	}
	
	

	

}
