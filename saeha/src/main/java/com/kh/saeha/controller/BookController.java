package com.kh.saeha.controller;


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

import com.kh.saeha.service.BookService;
import com.kh.saeha.service.ProgramService;
import com.kh.saeha.vo.BookVO;
import com.kh.saeha.vo.MemberVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketBuyVO;
import com.kh.saeha.vo.TicketVO;

@Controller
@RequestMapping("/sae_book/*")
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Inject
	BookService service;
	
	@Inject
	ProgramService pservice;
	
	//예약하기
	@RequestMapping(value="/bookview", method = RequestMethod.GET)
	public String postBookview( ProgramVO pvo , Model model,HttpServletRequest req) throws Exception{
		
//		 @ModelAttribute("scri") SearchCriteria scri,
		
		logger.info("예약하기 페이지");
	    
		
		
		model.addAttribute("bookview", pservice.bookview(pvo.getPg_bno()));
//		model.addAttribute("scri",scri);
	      
//	      return "redirect:/sae_book/booklist";  //예약리스트로 들어가
//	      return "redirect:/sae_book/bookview?pg_bno="+ pvo.getPg_bno();
	      return "/sae_book/book";      
		
	}
	
	//예약 페이지
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public void getBook(HttpServletRequest req,Model model,ProgramVO pvo,String pg_type) throws Exception{
		HttpSession session = req.getSession();
		session.getAttribute("member");
		logger.info("예약하러 가~~");
		System.out.println("bookpage");
	    System.out.println(pvo);
	    
	    List<ProgramVO> list = pservice.programlist(pg_type);

	    
		
		model.addAttribute("programlist", list);
	    
	    model.addAttribute("bookinfo", service.bookinfo(pvo.getPg_bno()));
	}
	
	
	   //예약하기
	   @RequestMapping(value = "/book", method = RequestMethod.POST)
	   public String postBook(Model model, BookVO vo, ProgramVO pvo) throws Exception{
		  
	      logger.info("예약하자~~");
	      System.out.println("book");
			
	      
	      System.out.println(vo);
	      System.out.println(pvo);
	     
	      int bk_bno = service.book(vo);//예약 후 데이터 보내는 것

	      System.out.println("bno : "+bk_bno);
	      System.out.println(service.bookread(bk_bno));
	      
	      
	      model.addAttribute("bookread",service.bookread(bk_bno)); //한번의 페이지 이동할 떄 데이터 전달 가능
	      model.addAttribute("programread",pvo); //한번의 페이지 이동할 떄 데이터 전달 가능
	      
	      return "redirect:/sae_book/booklist";  //예약리스트로 들어가
//	      return "sae_book/booklist";
	   }
	 //예약목록 조회
	 		@RequestMapping(value = "/booklist", method = RequestMethod.GET)
	 		public String list(HttpServletRequest req,Model model,  @ModelAttribute("scri") SearchCriteria scri) throws Exception{
	 			
	 			HttpSession session = req.getSession();
	 		    MemberVO id = (MemberVO)session.getAttribute("member");
	 			
	 			logger.info("booklist");
	 			
	 			
	 			BookVO vo = new BookVO();
	 			vo.setBk_id(id.getUserId());
	 			
	 			model.addAttribute("bookread", service.bookread(vo.getBk_bno()));
	 			model.addAttribute("programread", pservice.programread(vo.getPg_bno()));
	 			
	 			vo.setBk_type("1");
	 			model.addAttribute("booklist1",service.booklist(vo));
	 			
	 			vo.setBk_type("2");
	 			model.addAttribute("booklist2",service.booklist(vo));
	 			
	 			vo.setBk_type("3");
	 			model.addAttribute("booklist3",service.booklist(vo));
	 			
	 			
	 			
	 			PageMaker pageMaker = new PageMaker();
	 			pageMaker.setCri(scri);
	 			
	 			model.addAttribute("pageMaker",pageMaker);
	 			
	 			return "sae_book/booklist";
	 			
	 		}
	   
	   //예약확인 페이지
	   @RequestMapping(value = "/bookread", method = RequestMethod.GET)
	   public String postbookRead(BookVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		   
		   logger.info("bookread");
		   
		   model.addAttribute("bookread",service.bookread(vo.getBk_bno()));
		   model.addAttribute("programread",pservice.programread(vo.getBk_pno()));
		   model.addAttribute("scri",scri);
		   
		   return "sae_book/bookview";
	   }
	   
		//예약 취소
		@RequestMapping(value="/bookDelete", method = RequestMethod.GET)
		public String getDelete(@RequestParam("bk_bno") int bno,BookVO vo) throws Exception{
			
			service.bookDelete(bno);
			
			return "redirect:/sae_book/booklist";
			
		}
		
		//예매 변경 페이지로 이동
//		@RequestMapping(value="/bookupdateview")
//		public String getUpdate(HttpServletRequest req, Model model, BookVO vo,ProgramVO pvo ) throws Exception{
//			
//			HttpSession session = req.getSession();
//		    MemberVO id = (MemberVO)session.getAttribute("member");
//			
//			logger.info("bookupdateview");
//			
//			model.addAttribute("programread",pservice.programread(pvo.getPg_bno()));
//			model.addAttribute("bookUpdate", service.bookread(vo.getBk_bno()));
////			model.addAttribute("bookinfo", service.bookinfo(vo.getPg_bno()));
//			
//			return "sae_book/bookupdate";
//		}
	   
		//예매 변경
//		@RequestMapping(value="/bookUpdate", method = RequestMethod.POST)
//		public String postUpdate(HttpServletRequest req, BookVO vo, Model model, RedirectAttributes rttr) throws Exception{
//			
//			HttpSession session = req.getSession();
//		    MemberVO id = (MemberVO)session.getAttribute("member");
//			
//			logger.info("update");
//			service.bookread(vo.getBk_bno());
//			pservice.programread(vo.getPg_bno());
////			model.addAttribute("bookread", service.bookread(vo.getBk_bno()));
//			model.addAttribute("programread", pservice.programread(vo.getPg_bno()));
//			model.addAttribute("bookUpdate", service.bookread(vo.getBk_bno()));
//			
////			rttr.addAttribute("page",scri.getPage());
////			rttr.addAttribute("perPageNum",scri.getPerPageNum());
////			rttr.addAttribute("searchType",scri.getSearchType());
////			rttr.addAttribute("keyword",scri.getKeyword());
//			
//			
//			
//			rttr.addAttribute("pg_name",vo.getPg_name());
//			rttr.addAttribute("bk_type",vo.getBk_type());
//			rttr.addAttribute("bk_bno",vo.getBk_bno());
//			rttr.addAttribute("bk_name",vo.getBk_name());
//			rttr.addAttribute("bk_tel",vo.getBk_tel());
//			rttr.addAttribute("bk_inwon",vo.getBk_inwon());
//			rttr.addAttribute("bk_pdate",vo.getBk_pdate());
//			rttr.addAttribute("bk_time",vo.getBk_time());
//
//			
//			return "redirect:/sae_book/bookread?bk_bno=" +vo.getBk_bno();
////			return "redirect:/sae_program/programread?pg_bno="+vo.getPg_bno();
//		}
//	
}
