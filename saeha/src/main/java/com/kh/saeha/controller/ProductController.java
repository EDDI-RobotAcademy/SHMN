package com.kh.saeha.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.ProductService;
import com.kh.saeha.vo.ImgVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	private static final String CURR_IMAGE_REPO_PATH = "C:\\Spring_1123\\spring_git\\SHMN\\saeha\\src\\main\\webapp\\resources\\productimg\\";

	@Inject
	ProductService service;
	
	// 상품 메인화면
	@RequestMapping(value = "/productmain", method = RequestMethod.GET)
	public void productmain() throws Exception {
		logger.info("productmain");
	}

	// 상품 등록
	@RequestMapping(value = "/productwrite", method = RequestMethod.POST)
	public String productwrite(ProductVO productVO, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {

		logger.info("write");

		multipartRequest.setCharacterEncoding("utf-8");

		List<String> fileList = fileProcess(multipartRequest);

		productVO.setPd_file(fileList.size());

		service.productwrite(productVO);

		int bno = service.productbno(productVO);

		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				int ftotal = i + 1;
				Map<String, String> fileMap = new HashMap<>();
				fileMap.put("ino", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
				fileMap.put("ipath", (String) fileList.get(i)); // 파일의 경로 저장
				fileMap.put("bno", String.valueOf(bno)); // 게시글 넘버 저장
				service.fileSave(fileMap); // 파일 저장
			}
		}

		return "sae_product/productmain";

	}

	// 굿즈상품 리스트
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodslist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("goodslist");

		List<ProductVO> list = service.goodslist(scri);

		for (int i = 0; i < list.size(); i++) {
			ProductVO productVO = list.get(i);
			String path = service.getImg(productVO.getPd_bno()); 
			if (path == null) {
				productVO.setP_filepath("/productimg/img.png");

			} else {
				productVO.setP_filepath(path);
			}

		}

		model.addAttribute("goodslist", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.glistCount(scri));

		model.addAttribute("gpageMaker", pageMaker);

		return "sae_product/goodslist";
	}

	// 한복상품 리스트
	@RequestMapping(value = "/hanboklist", method = RequestMethod.GET)
	public String hanboklist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("hanboklist");

		List<ProductVO> list = service.hanboklist(scri);

		for (int i = 0; i < list.size(); i++) {
			ProductVO productVO = list.get(i);
			String path = service.getImg(productVO.getPd_bno()); 
			if (path == null) {
				productVO.setP_filepath("/productimg/img.png");

			} else {
				productVO.setP_filepath(path);
			}

		}

		model.addAttribute("hanboklist", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.hlistCount(scri));

		model.addAttribute("hpageMaker", pageMaker);

		return "sae_product/hanboklist";
	}

	// 상품 등록 화면
	@RequestMapping(value = "/registerView", method = RequestMethod.GET)
	public void registerView() throws Exception {
		logger.info("registerView");
	}

	// 상품 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(ProductVO prodcutVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("img", service.getImg(prodcutVO.getPd_bno()));
		model.addAttribute("imglist", service.imglist(prodcutVO.getPd_bno()));
		model.addAttribute("read", service.read(prodcutVO.getPd_bno()));
		model.addAttribute("readcount", service.readcount(prodcutVO.getPd_bno()));
		model.addAttribute("scri", scri);
		
		/*
		 * // 댓글 조회 List<PdReplyVO> replyList =
		 * replyService.readReply(prodcutVO.getPd_bno());
		 * model.addAttribute("replyList", replyList);
		 */
		return "sae_product/productView";
	}

	// 상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProductVO prodcutVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("delete");
		String type = "g";
		
		
		List<ImgVO> imglist = service.imglist(prodcutVO.getPd_bno());
		if (imglist != null) {
			for (ImgVO imgvo : imglist) {
				removeImg(imgvo.getIpath());
			}
		}

		service.idelete(prodcutVO.getPd_bno());
		service.delete(prodcutVO.getPd_bno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		if (prodcutVO.getPd_type().equals(type)) {
			return "redirect:/sae_product/goodslist";
		} else {
			return "redirect:/sae_product/hanboklist";
		}

	}

	// 상품 수정 화면
	@RequestMapping(value = "/productupdate", method = RequestMethod.GET)
	public String updateView(ProductVO productVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("productupdate");

		model.addAttribute("update", service.read(productVO.getPd_bno()));
		model.addAttribute("scri", scri);
		model.addAttribute("imglist", service.imglist(productVO.getPd_bno()));

		return "sae_product/productupdate";
	}

	// 상품 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProductVO productVO, @ModelAttribute("scri") SearchCriteria scri
			, HttpServletResponse response, RedirectAttributes rttr,
			MultipartHttpServletRequest multipartRequest) throws Exception {
		logger.info("update");
		multipartRequest.setCharacterEncoding("utf-8");
		String type = "g";
	    
		List<ImgVO> imglist = service.imglist(productVO.getPd_bno());
		if (imglist != null) {
			for (ImgVO imgvo : imglist) {
				removeImg(imgvo.getIpath());
			}
		}
		
		service.idelete(productVO.getPd_bno());
		
		List<String> fileList = fileProcess(multipartRequest);

		productVO.setPd_file(fileList.size());
		

		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				int ftotal = i + 1;
				Map<String, String> fileMap = new HashMap<>();
				fileMap.put("ino", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달
				fileMap.put("ipath", (String) fileList.get(i)); // 파일의 경로 저장
				fileMap.put("bno", String.valueOf(productVO.getPd_bno())); // 게시글 넘버 저장
				service.fileSave(fileMap); // 파일 저장
			}
		}
		
		service.update(productVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		if (productVO.getPd_type().equals(type)) {
			return "redirect:/sae_product/goodslist";
		} else {
			return "redirect:/sae_product/hanboklist";
		}
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
	
	
	
	
	/*
	 * //여기서부터 문의사항 게시판 //문의 댓글 작성
	 * 
	 * @RequestMapping(value = "/replyWrite", method = RequestMethod.GET) public
	 * String replyWrite(PdReplyVO vo, SearchCriteria scri, RedirectAttributes rttr)
	 * throws Exception { logger.info("댓글 작성 성공");
	 * 
	 * replyService.writeReply(vo);
	 * 
	 * rttr.addAttribute("py_bno", vo.getPy_bno()); rttr.addAttribute("page",
	 * scri.getPage()); rttr.addAttribute("perPageNum", scri.getPerPageNum());
	 * rttr.addAttribute("searchType", scri.getSearchType());
	 * rttr.addAttribute("keyword", scri.getKeyword());
	 * 
	 * 
	 * return "redirect:/sae_product/read?pd_bno=" + vo.getPy_bno(); //return
	 * "sae_product/read"; //return "/sae_product/read?pd_bno=" + vo.getPy_bno();
	 * //댓글을 작성했던 게시물로 이동.
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 * //댓글삭제를 누르면 보여준다
	 * 
	 * @RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
	 * public String replyDeleteView(PdReplyVO vo, SearchCriteria scri, Model model)
	 * throws Exception{ logger.info("reply delete view");
	 * 
	 * model.addAttribute("replyDelete", replyService.selectReply(vo.getPy_pno()));
	 * //pno 오타주의 model.addAttribute("scri", scri);
	 * 
	 * return "sae_product/replyDeleteView";
	 * 
	 * }
	 * 
	 * 
	 * //문의 댓글 삭제
	 * 
	 * @RequestMapping(value = "/replyDelete", method = RequestMethod.POST) public
	 * String replyDelete(PdReplyVO vo, SearchCriteria scri, RedirectAttributes
	 * rttr) throws Exception{ logger.info("댓글 삭제 완료");
	 * 
	 * replyService.deleteReply(vo);
	 * 
	 * //하나씩 삭제 rttr.addAttribute("py_pno", vo.getPy_pno());
	 * rttr.addAttribute("page", scri.getPage()); rttr.addAttribute("perPageNum",
	 * scri.getPerPageNum()); rttr.addAttribute("searchType", scri.getSearchType());
	 * rttr.addAttribute("keyword", scri.getKeyword());
	 * 
	 * return "redirect:/sae_product/read?pd_bno=" + vo.getPy_bno(); // return
	 * "redirect:/sae_product/productView?pd_bno=" + vo.getPy_pno(); // 댓글을 작성했던
	 * 게시물로 이동.
	 * 
	 * }
	 */	
	}

