package com.kh.saeha.controller;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.saeha.service.MemberService;
import com.kh.saeha.vo.MemberVO;

@CrossOrigin("*")
@RestController
public class MemberLoginController {
//ID 중복검사
	@Inject
	   MemberService service;
	
	@RequestMapping(value = "/over", method = RequestMethod.GET)
	 public ResponseEntity<String> postRegister(String userId) throws Exception {
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html;charset=UTF-8");
		
		MemberVO overover = new MemberVO();
		overover.setUserId(userId);
		String message = service.Over(overover);
		
		if(message == null) {
			return new  ResponseEntity<String>(" 사용할 수 있는 ID입니다.",header,HttpStatus.OK);
		} else {
			return new  ResponseEntity<String>(" 사용할 수 없는 ID입니다.",header,HttpStatus.OK);
		}
	}
}
