package com.gd.uspace.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired AdminService adminservice;

	//Q&A 관리 페이지 요청
	@RequestMapping(value="/adminQna")
	public String adminQna() {
		logger.info("관리자Qna페이지");
		return "admin/adminQna";
	}

	
	@RequestMapping(value="/group/register", method = RequestMethod.GET) public String index()
	{ logger.info("모임 등록 페이지"); return "group/groupRegistration"; }

	@RequestMapping(value="/sample", method = RequestMethod.GET) 
	public String sample() { 
		logger.info("샘플 페이지 이동"); return "group/sample"; 
	}

	}
