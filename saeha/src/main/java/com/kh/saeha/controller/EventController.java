package com.kh.saeha.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.saeha.service.EventService;
import com.kh.saeha.vo.EventVO;

@Controller
@RequestMapping("/sae_event/*")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	private static final String CURR_IMAGE_REPO_PATH = "C:\\Spring_1123\\spring_git\\SHMN\\saeha\\src\\main\\webapp\\resources\\eventimg\\";

	@Inject
	EventService service;

	// 메인화면 - 이벤트페이지 이동 + 게시글 불러오기(최신순 + 투표순)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainview(Model model) throws Exception {
		logger.info("mainView");

		List<EventVO> popular = service.popular();
		List<EventVO> recently = service.recently();

		model.addAttribute("popular", popular);
		model.addAttribute("recently", recently);

		return "sae_event/main";

	}

	// 메인 - 응모하기 - 응모페이지 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() throws Exception {

		return "sae_event/register";
	}

	// 게시글 작성하기
	@RequestMapping(value = "/registerView", method = RequestMethod.POST)
	public String registerView(EventVO eventvo, MultipartHttpServletRequest multipartRequest) throws Exception {

		String change = fileProcess(multipartRequest);
		eventvo.setEt_file(change);
		service.write(eventvo);
		return "redirect:/sae_event/main";
	}

	// 게시글 삭제하기(해당 id확인)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int bno) throws Exception {

		service.delete(bno);
		return "redirect:/sae_event/main";
	}

	// 게시글 상세보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int bno, Model model) throws Exception {

		EventVO detailView = service.read(bno);
		model.addAttribute("detailView", detailView);
		return "sae_event/detail";
	}

	// 이미지 저장
	private String fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<MultipartFile> fileNameList = multipartRequest.getFiles("file");
		for (MultipartFile mf : fileNameList) {
			String originalFileName = mf.getOriginalFilename();
			UUID uuid = UUID.randomUUID();

			if (originalFileName.length() > 0) {
				String imgExtension = originalFileName.substring(originalFileName.lastIndexOf("."),
						originalFileName.length());

				String saveName = uuid.toString() + imgExtension;

				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + saveName);
				if (mf.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdir()) {
							file.createNewFile();
						}
					}
					mf.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + saveName));
				}
				return saveName;

			}
		}

		return null;

	}

	// 이미지 삭제
	public void removeImg(String imgPath) {
		File file = new File(CURR_IMAGE_REPO_PATH + imgPath);
		file.delete();
	}

	// 투표하기
	@RequestMapping(value = "/upvote", method = RequestMethod.GET)
	public String upvote(int bno, int resultvote) throws Exception {

		EventVO result = new EventVO();
		result.setEt_bno(bno);
		result.setEt_vote(resultvote + 1);
		service.vote(result);
		return "redirect:/sae_event/main";
	}

	// 메인 - 응모방법
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit() throws Exception {

		return "sae_event/recruit";
	}
}
