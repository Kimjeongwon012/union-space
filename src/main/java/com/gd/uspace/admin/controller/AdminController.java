package com.gd.uspace.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.uspace.admin.service.AdminService;
import com.gd.uspace.point.dto.PointDTO;

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
