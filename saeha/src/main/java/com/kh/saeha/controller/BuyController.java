package com.kh.saeha.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.saeha.service.BuyService;
import com.kh.saeha.service.CouponService;
import com.kh.saeha.service.ProductService;
import com.kh.saeha.vo.BuyVO;
import com.kh.saeha.vo.CouponVO;
import com.kh.saeha.vo.ProductVO;

@Controller
@RequestMapping("/sae_buy/*")
public class BuyController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsBoardController.class);
	
	@Inject
	BuyService service;
	
	@Inject
	CouponService cservice;
	
	@Inject
	ProductService pservice;
	
	
	
	// 상품목록에서 상품구매를 눌렀을때
	@RequestMapping(value = "/buysingleView", method = RequestMethod.GET)
	public String buysingleView(Model model, ProductVO productVO, BuyVO buyVO,
			HttpServletRequest req) throws Exception{
		
		logger.info("buysingleView");
		
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		List<CouponVO> list = cservice.list(user_id);
		
		String path = pservice.getImg(productVO.getPd_bno());
		if (path == null) {
			model.addAttribute("img", "/productimg/img.png");

		} else {
			model.addAttribute("img", pservice.getImg(productVO.getPd_bno()));
		}
		
		
		model.addAttribute("buylist", service.buylist(productVO.getPd_bno()));
		model.addAttribute("couponlist", list);
		model.addAttribute("number", productVO.getPd_number());
		
		return "sae_buy/singlebuy";
	}
	
	// 구매
	@RequestMapping(value = "/buysingle", method = RequestMethod.POST)
	public String buysingle(BuyVO buyVO, CouponVO couponVO,
			HttpServletRequest req) throws Exception{
		
		logger.info("buysingleView");
		
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		buyVO.setBy_id(user_id);
		couponVO.setCoupon_id(user_id);
		service.buywrite(buyVO);
		
		// 구매시 재고수량에서 구매갯수 빼고 구매횟수만큼 buycount 더하기
		pservice.stock(buyVO);
		// 사용한 쿠폰 차감
		Integer coupon = couponVO.getCoupon_price();
		if(coupon != null) {
			cservice.used(couponVO);
		}
		
		
		return "sae_product/productmain";
	}
}
