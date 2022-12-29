package com.kh.saeha.service;

import java.util.List;

import com.kh.saeha.vo.CouponVO;

public interface CouponService {

	//쿠폰 조회
	public List<CouponVO> list(String userId) throws Exception;
	
	//쿠폰 사용 여부 확인 // 쿠폰 사용했는지 참,거짓으로 보는게 편할 것 같아 boolean 사용함
	public Boolean useType(String bno) throws Exception;
	
	//쿠폰 등록
	public void registerCoupon(CouponVO vo) throws Exception;
	
	//쿠폰 적용(사용)
	public void couponUpdate(String bno) throws Exception;
	
	//쿠폰타입(percent / price) 확인, 상품확인(굿즈 / 한복),
	//기간확인(지났는지 안지났는지) //가격에 적용하는 거라서 int로 바꾸어줬고, int money 추가해줌
	public int checkall(String bno, int money, String productType) throws Exception;
}
