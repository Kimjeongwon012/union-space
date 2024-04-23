package com.gd.uspace.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.uspace.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired SpaceService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 장소 등록 페이지 이동
	@RequestMapping(value="/spaceWriteForm", method = RequestMethod.GET)
	public String registerForm() throws IOException {
//		logger.info("장소 등록 Form");
		return "/space/spaceWriteForm";
	}
	
	// 장소 등록
	@RequestMapping(value="/space/register", method = RequestMethod.POST)
	public String addSpace(MultipartFile mainPhoto, MultipartFile[] photos, @RequestParam Map<String,String>param, HttpSession session, Model model) {
		logger.info("장소 등록 Controller"); 
		logger.info("param: "+param);
		logger.info("대표 사진: "+mainPhoto);
		logger.info("업체 사진: "+photos);
		
		int result = service.addSpace(param, mainPhoto, photos);
		if(result > 1) {
			logger.info("장소 등록 최종 완료");
		}

		
		return "/space/spaceWriteForm"; 
	}

	
}
