package com.kh.saeha.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.LikeService;
import com.kh.saeha.service.ProgramService;
import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.LikeVO;
import com.kh.saeha.vo.LikelistVO;
import com.kh.saeha.vo.MemberVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.ProgramVO;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_program/*")
public class ProgramController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramController.class);

	private static final String CURR_IMAGE_REPO_PATH = "C:\\Spring_1123\\spring_git\\SHMN\\saeha\\src\\main\\webapp\\resources\\programimg\\";

	@Inject
	ProgramService service;

	@Inject
	LikeService likeservice;

	@RequestMapping(value = "/program", method = RequestMethod.GET)
	public void getProgram() throws Exception {
		logger.info("상품등록하러가 !!!!!!");
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String postUpload(ProgramVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		logger.info("post upload~~~~");
		System.out.println("update");
		System.out.println(vo);

		multipartRequest.setCharacterEncoding("utf-8");

		List<String> fileList = fileProcess(multipartRequest);

		vo.setPg_file(fileList.size());

		service.upload(vo);

		int bno = service.programbno(vo);

		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				int ftotal = i + 1;
				Map<String, String> fileMap = new HashMap<>();
				fileMap.put("ino", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
				fileMap.put("ipath", (String) fileList.get(i)); // 파일의 경로 저장
				fileMap.put("bno", String.valueOf(bno)); // 게시글 넘버 저장
				service.pfileSave(fileMap); // 파일 저장
			}
		}
		return "redirect:/sae_program/programlist?pg_type=" + vo.getPg_type(); // 리스트로 들어가

	}

	// 관람 목록 조회
	@RequestMapping(value = "/programlist", method = RequestMethod.GET)
	public String list(String pg_type, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("programlist");

		List<ProgramVO> list = service.programlist(pg_type);

		for (int i = 0; i < list.size(); i++) {
			ProgramVO vo = list.get(i);
			String path = service.pgetImg(vo.getPg_bno());
			if (path == null) {
				vo.setPg_filepath("/programimg/img.png");

			} else {
				vo.setPg_filepath(path);
			}

		}

		model.addAttribute("programlist", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.plistCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "sae_program/programlist";
	}

	@RequestMapping(value = "/programview", method = RequestMethod.GET)
	public String postRead(HttpServletRequest req, ProgramVO vo, @ModelAttribute("scri") SearchCriteria scri,
			Model model) throws Exception {
		// ProgramVO vo 이전 페이지 정보받아오기 위해서 필요

		logger.info("read");
		HttpSession session = req.getSession();
		MemberVO id = (MemberVO) session.getAttribute("member");

		if (id == null) {
			return "sae_member/login";
		}

		LikeVO likevo = new LikeVO();
		likevo.setLk_pno(vo.getPg_bno());
		likevo.setLk_id(id.getUserId()); // 현재 유저아이디 받아오는 것

		logger.info("{}", likevo);// 데이터 보고 싶으면 이렇게 사용하기
		int lk_bno = 0;

		int check = likeservice.likecount(likevo);

		if (check == 0) {
			likeservice.like(likevo);
		} else if (check == 1) {
			lk_bno = likeservice.likegetinfo(likevo);
		}

		model.addAttribute("lk_bno", lk_bno);
		model.addAttribute("pimglist", service.pimglist(vo.getPg_bno()));
		model.addAttribute("programread", service.programread(vo.getPg_bno()));
		model.addAttribute("scri", scri);

		return "sae_program/programview";
	}

	// 게시글 삭제
	@RequestMapping(value = "/programDelete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("pg_bno") int bno, @RequestParam("pg_type") String pg_type) throws Exception {

		service.programDelete(bno);

		return "redirect:/sae_program/programlist?pg_type=" + pg_type;

	}

	// 프로그램 수정 뷰 @ModelAttribute("scri") SearchCriteria scri,
	@RequestMapping(value = "/programUpdateView", method = RequestMethod.GET)
	public String getUpdate(ProgramVO vo, Model model) throws Exception {

		logger.info("updateview");

		model.addAttribute("programUpdate", service.programread(vo.getPg_bno()));
//		model.addAttribute("scri", scri);
		model.addAttribute("pimglist", service.pimglist(vo.getPg_bno()));

		
		return "sae_program/programupdate";
	}

	// 프로그램 수정
	@RequestMapping(value = "/programUpdate", method = RequestMethod.POST)
	public String postUpdate(ProgramVO vo, Model model, RedirectAttributes rttr,
			MultipartHttpServletRequest multipartRequest) throws Exception {

		logger.info("update");
		
		multipartRequest.setCharacterEncoding("utf-8");
		
	    
		List<ImgVO> pimglist = service.pimglist(vo.getPg_bno());
		if (pimglist != null) {
			for (ImgVO imgvo : pimglist) {
				removeImg(imgvo.getIpath());
			}
		}
		
		service.pidelete(vo.getPg_bno());
		
		List<String> fileList = fileProcess(multipartRequest);

		vo.setPg_file(fileList.size());
		

		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				int ftotal = i + 1;
				Map<String, String> fileMap = new HashMap<>();
				fileMap.put("ino", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
				fileMap.put("ipath", (String) fileList.get(i)); // 파일의 경로 저장
				fileMap.put("bno", String.valueOf(vo.getPg_bno())); // 게시글 넘버 저장
				service.pfileSave(fileMap); // 파일 저장
			}
		}
		
		service.programUpdate(vo);
		model.addAttribute("programUpdate", service.programread(vo.getPg_bno()));

//		rttr.addAttribute("page",scri.getPage());
//		rttr.addAttribute("perPageNum",scri.getPerPageNum());
//		rttr.addAttribute("searchType",scri.getSearchType());
//		rttr.addAttribute("keyword",scri.getKeyword());

		rttr.addAttribute("pg_type", vo.getPg_type());
		rttr.addAttribute("pg_name", vo.getPg_name());
		rttr.addAttribute("pg_content", vo.getPg_content());
		rttr.addAttribute("pg_file", vo.getPg_file());
		rttr.addAttribute("pg_stock", vo.getPg_stock());
		rttr.addAttribute("pg_startdate", vo.getPg_startdate());
		rttr.addAttribute("pg_enddate", vo.getPg_enddate());
		rttr.addAttribute("pg_bstartdate", vo.getPg_bstartdate());
		rttr.addAttribute("pg_benddate", vo.getPg_benddate());

		return "redirect:/sae_program/programview?pg_bno=" + vo.getPg_bno();
//		return "redirect:/sae_program/programread?pg_bno="+vo.getPg_bno();
	}

	// 이미지 저장
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {

		// Iterator<String> fileNames = multipartRequest.getFileNames();
		List<MultipartFile> fileNameList = multipartRequest.getFiles("file");
		List<String> fileList = new ArrayList<>();
		for (MultipartFile mf : fileNameList) {
			String originalFileName = mf.getOriginalFilename();
			UUID uuid = UUID.randomUUID();

			if (originalFileName.length() > 0) {
				String imgExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
						originalFileName.length());

				String saveName = uuid.toString() + imgExtension;

				fileList.add(saveName);

				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + saveName);
				if (mf.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdir()) {
							file.createNewFile();
						}
					}
					mf.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + saveName));
				}

			}
		}

		return fileList;

	}

	// 이미지 삭제
	public void removeImg(String imgPath) {
		File file = new File(CURR_IMAGE_REPO_PATH + imgPath);
		file.delete();
	}

	// 마이페이지-찜목록 이동
	@RequestMapping(value = "/likelist", method = RequestMethod.GET)
	public String MypageLike(Model model, HttpSession session) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("member");

		List<LikelistVO> livo = likeservice.likelist(login.getUserId());


		model.addAttribute("likelist", livo);

		return "sae_program/likelist";

	}

}

//경로만 이동 ->GET , data값을 가져가면 ->POST
