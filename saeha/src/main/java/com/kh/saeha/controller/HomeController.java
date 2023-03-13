package com.kh.saeha.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.saeha.service.BoardnService;
import com.kh.saeha.service.FaqService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	BoardnService service;
	
	@Inject FaqService faqservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("nlist", service.nlist());
		model.addAttribute("list",faqservice.list());
		
		
		return "home";
	}
	
	
	// �삤�떆�뒗 湲�
	@RequestMapping(value = "/sae_map/map", method = RequestMethod.GET)
	public String delete() throws Exception {

		return "sae_map/map";
	}
}
