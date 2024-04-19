package com.gd.uspace.group.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/space/detail", method = RequestMethod.GET)
	public String sample() {
		logger.info("장소 상세보기 페이지 이동");
		return "space/spaceDetail";
	}
}
