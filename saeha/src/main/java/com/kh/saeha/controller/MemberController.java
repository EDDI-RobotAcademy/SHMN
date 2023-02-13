package com.kh.saeha.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.MemberService;
import com.kh.saeha.vo.MemberVO;

@Controller
@RequestMapping("/sae_member/*") 
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Autowired
	private JavaMailSender mailSender; // smtp기능을 위한 문구

	//회원가입약관 get
	@RequestMapping(value = "/agree_register", method = RequestMethod.GET)
	public String getRegisteragree() throws Exception {
		logger.info("get register 2022 1201");
		
		return "sae_member/agree_register";
		
	}
	
	
	// 회원가입 get 11
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register 2022 1201");
		
	}

	// 회원가입 get 22
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, Model model) throws Exception {
		logger.info("post register");
		service.register(vo);
		model.addAttribute("register", vo);
		return "sae_member/success_register";
	}

	// 로그인 33
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getlogin() throws Exception {
		
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login 444");

		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/sae_member/login";
		} else {
			session.setAttribute("member", login);
			session.setAttribute("userid", vo.getUserId());
			System.out.println(session.getAttribute("member"));
			logger.info("member777 : " + login);
			return "redirect:/";
		}
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// 회원정보 수정
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		return "sae_member/memberUpdateView";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {

		service.memberUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 회원탈퇴
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String delete(String userId, HttpSession session) throws Exception {

		MemberVO deleteUpdate = new MemberVO();
		deleteUpdate.setUserId(userId);

		service.memberDelete(deleteUpdate);

		session.invalidate();
		return "redirect:/";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPass", method = RequestMethod.GET)
	public String find() throws Exception {

		return "sae_member/findPass";
	}

	// 비밀번호 찾기 - ID입력
	@RequestMapping(value = "/findPass2", method = RequestMethod.GET)
	public String find2(String userId, Model model) throws Exception {

		MemberVO overover = new MemberVO();
		overover.setUserId(userId);
		String message = service.Over(overover);

		if (message == null) {
			return "sae_member/no_id";
		} else {

			MemberVO findPW = service.findfind(overover);
			model.addAttribute("FINDPW2", findPW);

			return "sae_member/findPass2";
		}
	}

	// 비밀번호 찾기 - 임시비밀번호 생성
	public static String getRamdomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

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

	// 비밀번호찾기 - 메일전송
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String sendmail(String userMail, String userId) throws Exception {

		String subject = "[새하마노]문의하신 임시비밀번호 발급 메일입니다.";
		String tempPW = getRamdomPassword(6);
		String content = "고객님의 비밀번호는" + tempPW + "입니다.";
		String from = "tnal13578@gmail.com";
		String to = userMail;

		MemberVO vo = new MemberVO();
		vo.setUserId(userId);
		vo.setUserPass(tempPW);
		service.memberPWupdate(vo);

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			mailHelper.setFrom(from);
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			// mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true는 html을 사용하겠다는 의미입니다.

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sae_member/sendmail";
	}

	// 카카오톡 로그인
	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakao(HttpServletRequest req, String userId, String birthday, String email , RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();
		MemberVO login = new MemberVO();

		login.setUserId(userId);
		login.setUserBirth(birthday);
		login.setUserMail(email);

		session.setAttribute("member", login);
		rttr.addFlashAttribute("msg", true);
		
		session.setAttribute("loginlogin", "kakao");
		return "redirect:/";
	}

	// naver 로그인
	@RequestMapping(value = "/naver", method = RequestMethod.GET)
	public String naver(HttpServletRequest req, String userId, String birthday, String email , RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();
		MemberVO login = new MemberVO();

		login.setUserId(userId);
		login.setUserBirth(birthday);
		login.setUserMail(email);
		
		session.setAttribute("member", login);
		rttr.addFlashAttribute("msg", true);
		
		session.setAttribute("loginlogin", "naver");
		System.out.println(login);

		return "redirect:/";
	}
	
	// naver 로그인
		@RequestMapping(value = "/callback", method = RequestMethod.GET)
		public String callback() throws Exception {

			

			return "/sae_member/callback";
		}
	
	// 구글 로그인
		@RequestMapping(value = "/google", method = RequestMethod.GET)
		public String google(HttpServletRequest req, String userId, String birthday, String email , RedirectAttributes rttr) throws Exception {

			HttpSession session = req.getSession();
			MemberVO login = new MemberVO();

			login.setUserId(userId);
			login.setUserBirth(birthday);
			login.setUserMail(email);
			
			session.setAttribute("member", login);
			rttr.addFlashAttribute("msg", true);
			
			session.setAttribute("loginlogin", "google");
			System.out.println(login);

			return "redirect:/";
		}
}