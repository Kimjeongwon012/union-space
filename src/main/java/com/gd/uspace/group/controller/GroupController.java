package com.gd.uspace.group.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/group/register")
	public String groupRegistration() {
		logger.info("모임 등록 페이지 이동");
		return "/group/groupRegistration";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		logger.info("테스트 페이지 이동");
		return "header&sidemenu";
	}
}
