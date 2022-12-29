package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//쿠폰 조회
	@Override
	public List<CouponVO> list(String userId) throws Exception {
		return sqlSession.selectList("couponMapper.list", userId);
	}

	//쿠폰 사용 여부 확인
	@Override
	public String useType(String bno) throws Exception {
		return sqlSession.selectOne("couponMapper.useType", bno);
	}
	
	//쿠폰 등록
	@Override
	public void registerCoupon(CouponVO vo) throws Exception {
		sqlSession.insert("couponMapper.registerCoupon", vo);
	}
	
	//쿠폰 적용(사용)
	@Override
	public void couponUpdate(String bno) throws Exception {
		sqlSession.update("couponMapper.couponUpdate", bno);
	}
	
	//쿠폰타입(percent / price) 확인, 상품확인(굿즈 / 한복),
	//기간확인(지났는지 안지났는지)
	@Override
	public CouponVO checkall(String bno) throws Exception {
		return sqlSession.selectOne("couponMapper.checkall", bno);
	}

}
