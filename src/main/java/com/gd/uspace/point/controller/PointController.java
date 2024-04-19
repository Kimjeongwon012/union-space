package com.gd.uspace.point.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
		logger.info("pointController");
		return "mypage/point";
	}
	
}
