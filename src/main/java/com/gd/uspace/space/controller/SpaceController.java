package com.gd.uspace.space.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceImageDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;
import com.gd.uspace.space.service.SpaceService;

@Controller
public class SpaceController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SpaceService spaceservice;
	
	@RequestMapping(value="/space/register", method = RequestMethod.GET)
	public String index() {
		logger.info("indexController");
		return "/space/spaceCreate";
	}
	
	@RequestMapping(value="/space/detail", method = RequestMethod.GET)
	public String spaceDetailgo(Model model, int space_no) {
		logger.info("장소 상세보기 페이지 이동");
		SpacePageDTO spacepageDTO = spaceservice.getSpacePage(space_no);
		/*
		 * logger.info("{}", spacepageDTO.getSpaceDTO().getSpace_name());
		 * logger.info("{}", spacepageDTO.getSpaceImageDTO()); logger.info("{}",
		 * spacepageDTO.getSpaceOperatingDTO().get(0)); logger.info("{}",
		 * spacepageDTO.getSpaceOperatingDTO().get(0).getSpace_day()); logger.info("{}",
		 * spacepageDTO.getSpaceOperatingDTO().get(0).getSpace_start_time());
		 * logger.info("{}",
		 * spacepageDTO.getSpaceOperatingDTO().get(0).getSpace_end_time());
		 * logger.info("{}", spacepageDTO.getSpaceReviewDTO()); logger.info("{}",
		 * spacepageDTO.getSpaceQuestionDTO()); logger.info("{}",
		 * spacepageDTO.getSpaceAnswerDTO());
		 */
		model.addAttribute("spacePage", spacepageDTO);
		model.addAttribute("space_no", space_no);
		return "/space/spaceDetail";
	}
	
	@RequestMapping(value="/space/reservation.do", method = RequestMethod.POST)
	public String reservationdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("예약 처리 요청");
		logger.info("{}", params);
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
			
			logger.info("예약 확인 페이지로 이동");
			page = "/space/spacePayment";
		} else {
			page = "/member/login";
		}
		return page;
	}

}
