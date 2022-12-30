package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.CouponVO;

public interface CouponDAO {

	public List<CouponVO> list(String userId) throws Exception;
	
	public String useType(String bno) throws Exception;
	
	public void registerCoupon(CouponVO vo) throws Exception;
	
	public void couponUpdate(String bno) throws Exception;
	
	public CouponVO checkall(String bno) throws Exception;
}
