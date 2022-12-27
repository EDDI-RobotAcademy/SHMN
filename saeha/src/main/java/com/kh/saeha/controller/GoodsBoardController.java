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

import com.kh.saeha.service.GoodsBoardReplyService;
import com.kh.saeha.service.GoodsBoardService;
import com.kh.saeha.vo.GoodsBoardReplyVO;
import com.kh.saeha.vo.GoodsBoardVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_goodsboard/*")
public class GoodsBoardController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsBoardController.class);
	
	@Inject
	GoodsBoardService service;
	
	@Inject
	GoodsBoardReplyService replyService;
	
	//게시판 글 작성 화면
	   @RequestMapping(value = "/writeView", method = RequestMethod.GET)
	   public String writeView(Model model,String pno) throws Exception{
	      logger.info("writeView");
		model.addAttribute("pno", pno);
	      
	      return "sae_goodsboard/writeView";
	   }
	   
	   
	   //게시판 글 작성
	   @RequestMapping(value = "/write", method = RequestMethod.POST)
	   public String write(GoodsBoardVO boardVO, RedirectAttributes rttr) throws Exception{
	      logger.info("write");
	      System.out.println(boardVO);
	      service.write(boardVO);
	      System.out.println();

	      return "redirect:/sae_goodsboard/list?pno="+ boardVO.getGwPno();
	   }

	
	// 게시판 목록 조회
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pno", scri.getPno());
		model.addAttribute("devideCount", service.devideCount(scri));
		
		return "sae_goodsboard/list";
	}
	
	//게시판 글 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(GoodsBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
	logger.info("read");
	
	model.addAttribute("read", service.read(boardVO.getGwBno()));
	model.addAttribute("scri", scri);
	
	List<GoodsBoardReplyVO> replyList = replyService.readReply(boardVO.getGwBno());
	model.addAttribute("replyList", replyList);
	
	// https://aibees.github.io/Why-Use-Service/
	return "sae_goodsboard/readView";
	
	}
	
	//게시판 수정 뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(GoodsBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getGwBno()));
		model.addAttribute("scri", scri);
		
		return "sae_goodsboard/updateView";
	}
	
	//게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(GoodsBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		logger.info("update");
		
	service.update(boardVO);
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/sae_goodsboard/list?pno=" + boardVO.getGwPno();
	}
	
	//게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(GoodsBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
	logger.info("delete delete");
	
	service.delete(boardVO.getGwBno());
	
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/sae_goodsboard/list?pno=" + boardVO.getGwPno();
	}
	
	//댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(GoodsBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("gwBno", vo.getGeBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/sae_goodsboard/readView";
	}
	
	//댓글 수정 GET
	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(GoodsBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply writeView~~~~");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getGeRno()));
		model.addAttribute("scri", scri);
		
		return "sae_goodsboard/replyUpdateView";
	}
	
	
	  //댓글 수정 POST
	  
	  @RequestMapping(value = "/replyUpdate", method = RequestMethod.POST) public
	  String replyUpdate(GoodsBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		  logger.info("reply Update~");
		  
		  replyService.updateReply(vo);
		  
		  rttr.addAttribute("gwBno", vo.getGeBno());
		  rttr.addAttribute("page", scri.getPage());
		  rttr.addAttribute("perPageNum", scri.getPerPageNum());
		  rttr.addAttribute("searchType", scri.getSearchType());
		  rttr.addAttribute("keyword", scri.getKeyword());
		  
		  return "redirect:/sae_goodsboard/readView";
	  }
	 
		/*
		 * RedirectAttributes
		 * 
		 * 폼 형식의 문서를 작성한 후, 서버로 보내면(POST방식) 곧이어 다른 페이지로 리다이렉트한다. 문제는 이러한 리다이렉트 방식이 GET
		 * 방식이라 데이터 전송에는 적절하지 않다. 리다이렉트가 발생하면 원래 요청은 끊어지고, 새로운 HTTP GET 요청이 시작된다.(브라우저에게
		 * 이 URL로 리다이렉트해!) 때문에 리다이렉트 실행 이전에 수행된 모델 데이터는 소멸한다. 따라서 리다이렉트로 (MODEL)모델을 전달하는
		 * 것은 의미 없다. 그러나 리다이렉트 방법으로도 데이터를 전달하는 방법이 있다. GET의 특징을 이용하는 것이다. 리다이렉트는 HTTP
		 * GET 메소드 방식이라고 앞서 말했다. GET방식은 아래 그림처럼 header에 ? 뒤에 파라미터를 붙여서 전달한다. 때문에 URL이
		 * 노출되는 단점이 있다. 그래서 스프링은 RedirectAttributes 클래스를 제공한다. 이 클래스는 모델의 기능을 그대로
		 * 확장(extends)했으며, 몇 개의 도움 메소드가 추가됐다. 여러 블로그를 보니 대부분이 RedirectAttributes가
		 * POST방식으로 전달한다고 설명했다. 아무래도 URL뒤에 파라미터가 붙어서 POST방시으로 전달하나 생각했나 보다. 하지만 POST방식은
		 * 아니다. 겉으로는 그렇게 보일 뿐인데 애초에 return redirect가 GET으로 가는데 말이 안되지 리다이렉트 자체가
		 * POST/Redirect/GET 패턴인데... RedirectAttributes는 아래 그림처럼 리다이렉트가 발생하기 전에 모든 플래시
		 * 속성을 세션에 복사한다. 리다이렉션 이후에는 저장된 플래시 속성을 세션에서 모델로 이동시킨다. 헤더에 파라미터를 붙이지 않기 떄문에
		 * URL에 노출되지 않는다.
		 * 
		 * https://blog.naver.com/allkanet72/22096499929
		 */	  
	  
	  //댓글 삭제 GET
	  @RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
	  public String replyDeleteView(GoodsBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		  logger.info("reply DeleteView Form~~");
		  
		  model.addAttribute("replyDelete", replyService.selectReply(vo.getGeRno()));
		  model.addAttribute("scri", scri);
		  
		  return "sae_goodsboard/replyDeleteView";
	  }
	  
	  //댓글 삭제
	  @RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	  public String replyDelete(GoodsBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		  logger.info("reply Delete Action~~~");
		  
		  replyService.deleteReply(vo);
		  
		  rttr.addAttribute("gwBno", vo.getGeBno());
		  rttr.addAttribute("page", scri.getPage());
		  rttr.addAttribute("perPageNum", scri.getPerPageNum());
		  rttr.addAttribute("searchType", scri.getSearchType());
		  rttr.addAttribute("keyword", scri.getKeyword());
		  
		  return "redirect:/sae_goodsboard/readView";
	  }
}

