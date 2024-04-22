package com.gd.uspace.space.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SpaceController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 장소 등록 페이지 이동
	@RequestMapping(value="/spaceWriteForm", method = RequestMethod.GET)
	public String registerForm() {
		logger.info("장소 등록 Form");
		return "/space/spaceWriteForm";
	}
	
	// 장소 등록
	@RequestMapping(value="/space/register", method = RequestMethod.POST)
	public String register(MultipartFile mainPhoto, MultipartFile[] photos, HttpSession session, Model model, @RequestParam Map<String,String>param) {
		logger.info("장소 등록 Controller"); 
		logger.info("param: "+param);
		//logger.info("photos: "+photos);

		
		return "/space/spaceWriteForm"; 
	}

	
}
