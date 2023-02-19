package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 장바구니 추가
	@Override
	public void addcart(CartVO cartVO) throws Exception {

		sqlSession.insert("cartMapper.addcart", cartVO);
		
	}
	
	// 장바구니 중복체크
	@Override
	public int checkcart(ProductVO productVO) throws Exception {
		
		int num = sqlSession.selectOne("cartMapper.checkcart", productVO);
		
		return num;
	}
	
	
	// 장바구니 리스트
	@Override
	public List<CartVO> cartlist(String user_id) throws Exception {
		
		return sqlSession.selectList("cartMapper.cartlist", user_id);
	}
	
	// 재고 수
	@Override
	public int stock(CartVO cartVO) throws Exception {
		
		int stock = sqlSession.selectOne("cartMapper.stock" ,cartVO);
		
		return stock;
	}

	@Override
	public void delete(CartVO cartVO) throws Exception {
		
		sqlSession.delete("cartMapper.delete", cartVO);
		
	}
	
	// 재고 0인 장바구니 삭제
	@Override
	public void nonstock(int ct_pno) throws Exception {
		sqlSession.delete("cartMapper.nonstock", ct_pno);
	}
	
	

}
