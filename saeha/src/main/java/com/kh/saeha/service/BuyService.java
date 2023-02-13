package com.kh.saeha.service;

import com.kh.saeha.vo.ProductVO;

public interface BuyService {
	
	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	public ProductVO buylist(int pd_bno) throws Exception;

}
