package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.CouponDAO;
import com.kh.saeha.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {

	@Inject
	private CouponDAO dao;
	
	//쿠폰 조회
	@Override
	public List<CouponVO> list(String userId) throws Exception {
		return dao.list(userId);
	}

	//쿠폰 사용 여부 확인 // 쿠폰 사용했는지 참,거짓으로 보는게 편할 것 같아 boolean 사용함
	@Override
	public Boolean useType(String bno) throws Exception {
		String useType = dao.useType(bno);
		
		if(useType.equals("사용완료")) { //사용완료인 쿠폰일 경우
			System.out.println("사용완료. 더 이상 사용할 수 없는 쿠폰입니다.");
			return true;
		}else {
			System.out.println("사용가능한 쿠폰입니다.");
			return false;
		}
	}
	
	//쿠폰 등록
	@Override
	public void registerCoupon(CouponVO vo) throws Exception {
		dao.registerCoupon(vo);
	}

	//쿠폰 적용(사용)
	@Override
	public void couponUpdate(String bno) throws Exception {
		dao.couponUpdate(bno);
	}

	//쿠폰타입(percent / price) 확인, 상품확인(굿즈 / 한복),
	//기간확인(지났는지 안지났는지) //가격에 적용하는 거라서 int로 바꾸어줬고, int money 추가해줌
	@Override
	public int checkall(String bno, int money, String productType) throws Exception {
		CouponVO vo = dao.checkall(bno);
		
		if(productType.equals(vo.getCoupon_product()) == false) {
			return -1; 
			//vo에서 product상품명과 구입하려는 상품명이 다를 경우 쿠폰 적용을 시키지 않기 위해서
			//-1을 리턴해준다.
			//true일 경우에는 돈을 계산해서 출력할거라 쓰지 않았다.
		}
		
		if(vo.getCoupon_type().equals("percent")) {
			String percent = vo.getCoupon_percent();
			
			int typePercent = Integer.parseInt(percent);
			return money*(100-typePercent)/100;
		}else { //price일 경우
			String price = vo.getCoupon_price();
			
			int typePrice = Integer.parseInt(price);
			int total = money-typePrice;
			
			if(total < 0) { //할인금액이 총결제금액보다 큰 경우 0원을 리턴하겠다.
				return 0;
			}else {
				return total;
			}
		}
		
	}

}
