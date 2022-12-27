package com.kh.saeha.controller;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.model.StorageType;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@CrossOrigin("*")
@RestController
public class MemberSMSController {

	final DefaultMessageService messageService;

	public MemberSMSController() {
		// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
		this.messageService = NurigoApp.INSTANCE.initialize("NCSLNKDDATJOA3AS", "HVBERG4IH6ZKLNIPWOGIVDYEKLY90RBP",
				"https://api.coolsms.co.kr");
	}

	/**
	 * 단일 메시지 발송 예제
	 */
	@GetMapping("/send-one")
	public String sendOne(String userTel) {
		Message message = new Message();
		// 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
		message.setFrom("01020870112");
		message.setTo(userTel);
		
		String nansu = getRamdomPassword(6); 
		
		message.setText("새하마노 인증번호는 " + nansu + " 입니다.");

		SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		return nansu;
	}

	// 비밀번호 찾기 - 임시비밀번호 생성
	public static String getRamdomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

		int idx = 0;
		StringBuffer sb = new StringBuffer();

		System.out.println("charSet.length :::: " + charSet.length);

		for (int i = 0; i < len; i++) {

			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			System.out.println("idx :::: " + idx);
			sb.append(charSet[idx]);
		}

		return sb.toString();
	}

}
