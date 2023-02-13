package com.kh.saeha.controller;


import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.saeha.service.BoardnService;
import com.kh.saeha.vo.BoardnVO;


@Controller
@RequestMapping(value = "/sae_boardn/*")
//sae_boardn으로 들어오는 모든 파일 처리
public class BoardnController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardnController.class);
	
	@Inject
	BoardnService service;
	
//	SqlSession sql;

		//공지게시판 목록
		@RequestMapping(value = "/nlist", method = RequestMethod.GET)
		public String nlist(Locale locale, Model model) throws Exception{
			logger.info("공지게시판 보기 성공");
			
			model.addAttribute("nlist", service.nlist());
			
			return "sae_boardn/nlist";
			
		}
		
		///공지게시판의 글 작성 폼
		@RequestMapping(value = "/nwriteView", method = RequestMethod.GET)
		public void nwriteview() throws Exception {
			logger.info("nwriteView");
			
		}
		
		///공지게시판 글 등록
		@RequestMapping(value = "/nwrite", method = RequestMethod.POST)
		public String nwrite(BoardnVO boardnVO) throws Exception {
			logger.info("공지게시판 글 등록 성공");
			
			service.nwrite(boardnVO);
			
			return "redirect:/sae_boardn/nlist";
			
		}
		
//		//공지게시판 글, 이미지 등록
//		@RequestMapping(value = "/sae_boardn/nwrite", method = RequestMethod.POST)
//		public String nwrite(MultipartHttpServletRequest request) {
//			BoardnVO vo = new BoardnVO();
//			vo.setN_bno(Integer.parseInt(request.getParameter("n_bno")));
//			vo.setN_title(request.getParameter("n_title"));
//			vo.setN_content(request.getParameter("n_content"));
//		
//		//파일 업로드
//		MultipartFile mf = request.getFile("boardn_file");
//		String path = request.getRealPath("uploadFile/boardn");//저장 될 위치
//		String n_file = mf.getOriginalFilename();
//		File uploadFile = new File(path+"//"+n_file);
//		try {
//			mf.transferTo(uploadFile);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		vo.setFilename(n_file);
//		
//		sql.insert("boardnMapper.insert", vo);
//		
//		return "/sae_boardn/nwrite";
//	}
		
		
		//공지게시판 상세보기
		@RequestMapping(value = "/nread", method = RequestMethod.GET)
		public String nread(BoardnVO boardnVO, Model model) throws Exception {
			logger.info("공지게시판 상세보기");
			
			model.addAttribute("nread", service.nread(boardnVO.getN_bno()));
		
			
			return "sae_boardn/nread";
			
		}
		
		
		//공지게시판 수정폼
		@RequestMapping(value = "/nupdateView", method = RequestMethod.GET)
		public String nupdateView(BoardnVO boardnVO, Model model) throws Exception {
			logger.info("nupdateView");
			
			model.addAttribute("nupdate", service.nread(boardnVO.getN_bno()));
			
			return "sae_boardn/nupdateView";
			
		}
		
		//공지게시판 수정
		@RequestMapping(value = "/nupdate", method = RequestMethod.POST)
		public String nupdate(BoardnVO boardnVO) throws Exception {
			logger.info("공지게시판 글 수정 완료");
			
			service.nupdate(boardnVO);
			
			return "redirect:/sae_boardn/nlist";
			
		}
		
		//공지 게시판 삭제
		@RequestMapping(value = "/ndelete", method = RequestMethod.POST)
		public String ndelete(BoardnVO boardnVO) throws Exception {
			logger.info("공지게시판 글 삭제");
			
			service.ndelete(boardnVO.getN_bno());
			
			return "redirect:/sae_boardn/nlist";
			
		}
		
	}

