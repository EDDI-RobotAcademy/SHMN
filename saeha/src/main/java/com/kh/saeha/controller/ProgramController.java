package com.kh.saeha.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.ProgramService;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_program/*")
public class ProgramController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramController.class);
	
	@Inject
	ProgramService service;
	
//	@Inject
//	LikeService likeservice;
	
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
		
		return "redirect:/sae_program/programlist?type="+vo.getPg_type(); //리스트로 들어가
	}
	
	//게시판 목록 조회
	@RequestMapping(value = "/programlist", method = RequestMethod.GET)
	public String list(String type, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("programlist");
		
		model.addAttribute("programlist", service.programlist(type));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.plistCount(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "sae_program/programlist";
	}
	
	
	@RequestMapping(value = "/programview", method = RequestMethod.GET)
	public String postRead(ProgramVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		logger.info("read");
		
//		lvo.setLk_bno(lk_bno);
//		lvo.setLtmid(currentUserName());
		
//		int ltlike = 0;		
//		int check = likeservice.likecount(lvo);
//		
//		if(check ==0) {
//			
//			likeservice.like(lvo);
//			
//		}else if(check==1) {
//			
//			ltlike = likeservice.likegetinfo();
//		}
//		
//		model.addAttribute("ltlike",ltlike);
		
		model.addAttribute("programread", service.programread(vo.getPg_bno()));
		model.addAttribute("scri",scri);
		
		
		
		
		return "sae_program/programview";
	}
	
	//게시글 삭제
	@RequestMapping(value="/programDelete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("pg_bno") int bno) throws Exception{
		
		service.programDelete(bno);
		
		return "redirect:/sae_program/programlist";
		
	}
	
	//프로그램 수정 뷰
	@RequestMapping(value = "/programUpdateView", method = RequestMethod.GET)
	public String getUpdate(ProgramVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		logger.info("updateview");
		
		
		model.addAttribute("programUpdate",service.programread(vo.getPg_bno()));
		model.addAttribute("scri", scri);
		
		return "sae_program/programupdate";
	}
	
	//게시물 수정
	@RequestMapping(value="/programUpdate", method = RequestMethod.POST)
	public String postUpdate(ProgramVO vo, @ModelAttribute("scri") SearchCriteria scri,Model model, RedirectAttributes rttr) throws Exception{
		
		logger.info("update");
		
		service.programUpdate(vo);
		model.addAttribute("programUpdate",service.programread(vo.getPg_bno()));
		
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/sae_program/programview?pg_bno=" +vo.getPg_bno();
//		return "redirect:/sae_program/programread?pg_bno="+vo.getPg_bno();
	}

	
}

//경로만 이동 ->GET , data값을 가져가면 ->POST
