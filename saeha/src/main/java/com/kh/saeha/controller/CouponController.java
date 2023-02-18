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

import com.kh.saeha.service.CouponService;
import com.kh.saeha.vo.CouponVO;

@Controller
@RequestMapping("/sae_coupon/*")
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	CouponService service;
	
	// 쿠폰 등록 화면
	@RequestMapping(value = "/couponregisterView", method = RequestMethod.GET)
	public String couponregister(Model model, HttpServletRequest req) throws Exception {
		
		logger.info("couponregisterView");
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		if(user_id == null || user_id == "") {
			return "sae_member/login";
		}else {
			List<CouponVO> list = service.list(user_id);
			
			model.addAttribute("couponlist", list);
			
			return "sae_coupon/couponregister";
		}
	}
	
	// 쿠폰등록
	@RequestMapping(value = "/couponregister", method = RequestMethod.POST)
	public String couponregister(CouponVO couponvo) throws Exception {
		
		service.registerCoupon(couponvo);
		
		return "redirect:/sae_coupon/couponregisterView";
	}
	
}
