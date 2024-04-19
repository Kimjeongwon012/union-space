package com.gd.uspace.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	  
	@RequestMapping(value="/sample", method = RequestMethod.GET) 
	public String sample() { 
		logger.info("샘플 페이지 이동"); return "group/sample"; 
	}
	 
}

