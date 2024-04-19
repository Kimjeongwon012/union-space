package com.gd.uspace.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//최초 메인페이지 요청
//	@RequestMapping(value="/")
//	public String home() {
//		logger.info("최초 메인페이지 요청");
//		return "index";
//	}
	
	//Q&A 관리 페이지 요청
	@RequestMapping(value="/adminQna")
	public String adminQna() {
		logger.info("관리자Qna페이지");
		return "admin/adminQna";
	}
}

