package com.kh.saeha.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.saeha.service.FaqService;
import com.kh.saeha.vo.FaqVO;


@Controller
@RequestMapping("/sae_faq/*")

public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Inject FaqService service;
	
	//faq 목록 보기
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		
		logger.info("**********Controller list start**********");		 
		model.addAttribute("list",service.list());
		return "sae_faq/faqList";
	}
			// 오라클 > dao > 서비스 > 컨트롤러로 가져온 데이터들을 jsp에 뿌려주는 작업
	
	
	//faq 글 작성 페이지로 이동(Get)
	@RequestMapping(value="/faqWriteView", method = RequestMethod.GET)
	public void faqWriteView() throws Exception{
		logger.info("**********Controller writeview start**********");
	}
	
	
	//faq 글 작성 (post)
	@RequestMapping(value = "/faqWrite", method =  RequestMethod.POST)
		public String insert(FaqVO faqVO) throws Exception{
			logger.info("**********Controller write start**********");
		service.insert(faqVO);
		return "redirect:/sae_faq/faqList";
	}
	
	
	//faq 상세보기
	@RequestMapping(value = "/faqReadView", method = RequestMethod.GET)
	public String read(FaqVO faqVO, Model model) throws Exception{
		logger.info("**********Controller read start**********");
		model.addAttribute("read", service.read(faqVO.getFaq_bno()));
		return "sae_faq/faqReadView";
	}
	
	
	// faq 수정 view
	@RequestMapping(value = "/faqUpdateView", method = RequestMethod.GET)
	public String faqUpdateView(FaqVO faqVO, Model model) throws Exception{
		logger.info("**********Controller updateview start**********");
		model.addAttribute("update", service.read(faqVO.getFaq_bno()));
		
		return "sae_faq/faqUpdateView";
	}
	
	
	//faq 글 수정
		@RequestMapping(value = "/faqupdate", method = RequestMethod.POST)
		public String update(FaqVO faqVO) throws Exception{
			logger.info("**********Controller update start**********");
			System.out.println("update");
			System.out.println(faqVO);
			service.update(faqVO);
			
			return "redirect:/sae_faq/faqList";
		}
		
		
	// faq 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(FaqVO faqVO) throws Exception {
			logger.info("**********Controller delete start**********");
			
			service.delete(faqVO.getFaq_bno());
			
			return "redirect:/sae_faq/faqList";
		}	
}
