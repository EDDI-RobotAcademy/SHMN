package com.kh.saeha.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.saeha.service.LikeService;
import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.MemberVO;

@RestController
@RequestMapping("/sae_like/*")
public class LikeController {

	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Inject
	LikeService likeservice;
	
	@PutMapping("/likeupdate")
	public @ResponseBody Map<String,String> likeupdate(HttpServletRequest req,@RequestBody LikeVO lvo){
			logger.info("before {}",lvo);
			HttpSession session = req.getSession();
			MemberVO member =(MemberVO)session.getAttribute("member");
			logger.info("likeupdate");
			
			lvo.setLk_id(member.getUserId());
			
			Map<String,String> map = new HashMap<String, String>();
			logger.info("{}",lvo);
			try {
				likeservice.likeupdate(lvo);
				map.put("result", "success");
				
			}catch(Exception e) {
				e.printStackTrace();
				map.put("result", "fail");
			}
			
			return map;
		}
	
	//찜목록에서 예약하러가기
}
