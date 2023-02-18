package com.kh.saeha.controller;

import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.LikeService;
import com.kh.saeha.service.ProgramService;
import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.MemberVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_program/*")
public class ProgramController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramController.class);
	
	@Inject
	ProgramService service;
	
	@Inject
	LikeService likeservice;
	
	@RequestMapping(value = "/program", method = RequestMethod.GET)
	public void getProgram() throws Exception {
		logger.info("상품등록하러가 !!!!!!");
	}
	

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String postUpload(ProgramVO vo) throws Exception{
		logger.info("post upload~~~~");
		System.out.println("update");
		System.out.println(vo);
		service.upload(vo);
		
		return "redirect:/sae_program/programlist?pg_type="+vo.getPg_type(); //리스트로 들어가
	}
	
	//	게시판 목록 조회
	@RequestMapping(value = "/programlist", method = RequestMethod.GET)
	public String list(String pg_type, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("programlist");
		
		model.addAttribute("programlist", service.programlist(pg_type));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.plistCount(scri));
		
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "sae_program/programlist";
	}
	
	
	@RequestMapping(value = "/programview", method = RequestMethod.GET)
	public String postRead(HttpServletRequest req, ProgramVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		//ProgramVO vo 이전 페이지 정보받아오기 위해서 필요
		
		logger.info("read");
		HttpSession session = req.getSession();
	    MemberVO id = (MemberVO)session.getAttribute("member");

		LikeVO likevo = new LikeVO();
		likevo.setLk_pno(vo.getPg_bno());
		likevo.setLk_id(id.getUserId());  //현재 유저아이디 받아오는 것

		logger.info("{}",likevo);//데이터 보고 싶으면 이렇게 사용하기
		int lk_bno = 0;

		int check = likeservice.likecount(likevo);

		if(check == 0) {
		    likeservice.like(likevo);
		}else if(check==1) { 
		lk_bno = likeservice.likegetinfo(likevo);
		}

		model.addAttribute("lk_bno",lk_bno);
		
		model.addAttribute("programread", service.programread(vo.getPg_bno()));
		model.addAttribute("scri",scri);
		
		
		
		
		return "sae_program/programview";
	}
	
	//게시글 삭제
	@RequestMapping(value="/programDelete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("pg_bno") int bno,ProgramVO vo) throws Exception{
		
		service.programDelete(bno);
		
		return "redirect:/sae_program/programlist?pg_type="+vo.getPg_type();
		
	}
	
	//프로그램 수정 뷰  @ModelAttribute("scri") SearchCriteria scri,
	@RequestMapping(value = "/programUpdateView", method = RequestMethod.GET)
	public String getUpdate(ProgramVO vo, Model model) throws Exception {
		
		logger.info("updateview");
		
		
		model.addAttribute("programUpdate",service.programread(vo.getPg_bno()));
//		model.addAttribute("scri", scri);
		
		return "sae_program/programupdate";
	}
	
	//게시물 수정
	@RequestMapping(value="/programUpdate", method = RequestMethod.POST)
	public String postUpdate(ProgramVO vo, Model model, RedirectAttributes rttr) throws Exception{
		
		logger.info("update");
		
		service.programUpdate(vo);
		model.addAttribute("programUpdate",service.programread(vo.getPg_bno()));
		
//		rttr.addAttribute("page",scri.getPage());
//		rttr.addAttribute("perPageNum",scri.getPerPageNum());
//		rttr.addAttribute("searchType",scri.getSearchType());
//		rttr.addAttribute("keyword",scri.getKeyword());
		
		rttr.addAttribute("pg_type",vo.getPg_type());
		rttr.addAttribute("pg_name",vo.getPg_name());
		rttr.addAttribute("pg_content",vo.getPg_content());
		rttr.addAttribute("pg_file",vo.getPg_file());
		rttr.addAttribute("pg_stock",vo.getPg_stock());
		rttr.addAttribute("pg_startdate",vo.getPg_startdate());
		rttr.addAttribute("pg_enddate",vo.getPg_enddate());
		rttr.addAttribute("pg_bstartdate",vo.getPg_bstartdate());
		rttr.addAttribute("pg_benddate",vo.getPg_benddate());
		rttr.addAttribute("pg_time",vo.getPg_time());
		
		return "redirect:/sae_program/programview?pg_bno=" +vo.getPg_bno();
//		return "redirect:/sae_program/programread?pg_bno="+vo.getPg_bno();
	}
	
	//마이페이지 이동(memberController로 이동 예정)
//	@RequestMapping(value="/likelist", method = RequestMethod.POST)
//	public String Mypage (Model model, HttpSession session) throws Exception{
//		MemberVO login = (MemberVO)session.getAttribute("member");
//		
//		//빈 LikeVo를 만든다.
//		LikeVO lvo = new LikeVO();
//		//빈 LikeVo에 유저 정보를 넣는다.
//		lvo.setLk_id(login.getUserId());
//		//해당 유저가 좋아요한 pno만 뽑아온다.(1)
//		List<LikeVO> likevo = likeservice.likelist(lvo);
//		//빈 ProgramVO 리스트를 만든다.(2)
//		List<ProgramVO> pvo = new LinkedList<ProgramVO>();
//		
//		for(int i=0; i < likevo.size() ; i++ ) {
//			//(1)에서 뽑아온 pno 리스트에서 하나씩 뽑아낸다.
//			LikeVO lv = likevo.get(i);
//			//pno값을 빼온다.
//			int pno = lv.getLk_pno();
//			//해당 pno의 프로그램 정보를 읽어온다.
//			ProgramVO pv = service.programread(pno);
//			//(2)의 비어있던 programVO에 읽어온 pno 프로그램 정보들을 하나씩 추가한다.
//			pvo.add(pv);
//		}
//		
//		model.addAttribute("likelist", pvo);
//		
//		
//		
//		return "sae_member/mypage";
//		
//	}

	
	
}

//경로만 이동 ->GET , data값을 가져가면 ->POST
