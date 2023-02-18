package com.kh.saeha.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.saeha.service.TicketBuyService;
import com.kh.saeha.service.TicketService;
import com.kh.saeha.vo.TicketVO;
import com.kh.saeha.vo.SearchCriteria;
import com.kh.saeha.vo.TicketBuyVO;

@Controller
@RequestMapping("/sae_ticket/*")

public class TicketController {
	
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);

	@Inject
	TicketService service;
	@Inject
	TicketBuyService buyservice;
	
	
	
	//ticket list 보기
	@RequestMapping(value = "/ticketList", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri ) throws Exception {
		logger.info("********** 티켓 리스트 **********");
		model.addAttribute("list",service.list(scri));
		return "sae_ticket/ticketList";
	}
	/*ticket list 보기
	@RequestMapping(value = "/ticketList", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("********** 티켓 리스트 **********");
		model.addAttribute("list",service.list());
		return "sae_ticket/ticketList";
	}
	*/
	//ticket 등록 view 페이지로 이동(GET)
	@RequestMapping(value="/tkWriteView", method = RequestMethod.GET)
	public void	 tkWriteView() throws Exception{
		logger.info("********** 티켓 등록 뷰 **********");
	}
	
	//ticket 등록(post)
	@RequestMapping(value = "/tkWrite", method =  RequestMethod.POST)
	public String insert(TicketVO vo) throws Exception{
		logger.info("**********Controller write start**********");
	service.insert(vo);
	return "redirect:/sae_ticket/ticketList";
}
	//ticket 상세보기
	@RequestMapping(value = "/tkReadView", method = RequestMethod.GET)
	public String read(TicketVO vo, Model model) throws Exception{
		logger.info("**********Controller read start**********");
		model.addAttribute("read", service.read(vo.getTk_bno()));
		return "sae_ticket/tkReadView";
	}
	
	//ticket 수정 view
	@RequestMapping(value = "/tkUpdateView", method = RequestMethod.GET)
	public String tkUpdateView(TicketVO vo, Model model) throws Exception{
		logger.info("**********Controller updateview start**********");
		model.addAttribute("update", service.read(vo.getTk_bno()));
		
		return "sae_ticket/tkUpdateView";
	}
	
	//ticket 수정	
	@RequestMapping(value = "/ticketUpdate", method = RequestMethod.POST)
	public String update(TicketVO vo) throws Exception{
		logger.info("**********Controller update start**********");
		System.out.println("update");
		service.update(vo);
		
		return "redirect:/sae_ticket/ticketBook?day=2";
	}
	
	//ticket 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(TicketVO vo) throws Exception {
		logger.info("**********Controller delete start**********");
		
		service.delete(vo.getTk_bno());
		
		return "redirect:/sae_ticket/ticketBook?day=2";
	}	
	
	@RequestMapping(value = "/ticketBook", method = RequestMethod.GET)
	public String ticketBook(String day, Model model) throws Exception {
		logger.info("**********Controller book **********");
		model.addAttribute("day", service.sday(day));

		
		return "sae_ticket/ticketBook";
	}	
	@RequestMapping(value = "/tkBookPage", method = RequestMethod.GET)
	public String tkBookPage(int tk_bno, Model model) throws Exception {
		logger.info("**********Controller book **********");
		model.addAttribute("vo", service.read(tk_bno));
		
		return "sae_ticket/tkBookPage";
	}	
	@RequestMapping(value = "/ticketBuy", method = RequestMethod.POST)
	public String ticketBuy(TicketBuyVO vo) throws Exception {
		logger.info("**********Controller book **********");
		TicketVO ticketVO = service.read(vo.getBt_pno());

		if (ticketVO.getTk_stock()-vo.getBt_count() >= 0) {
			ticketVO.setTk_stock(ticketVO.getTk_stock()-vo.getBt_count());
			buyservice.insert(vo);
			service.stockupdate(ticketVO);
			
		}
		return "sae_ticket/ticketList";
	}	
	/*예약 내역 확인
	@RequestMapping(value = "/tkMyBook", method = RequestMethod.GET)
	public String tkMyBook(int tk_bno, Model model) throws Exception {
		logger.info("**********Controller book **********");
		model.addAttribute("vo", service.read(tk_bno));
		
		return "sae_ticket/tkBookPage";
	}	
	*/
	
	
}
