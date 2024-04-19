package com.gd.uspace.space.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpaceController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/space/register", method = RequestMethod.GET)
	public String index() {
		logger.info("indexController");
		return "/space/spaceCreate";
	}
}
