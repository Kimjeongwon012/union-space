package com.gd.uspace.point.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;


	// 포인트 내역 출력
	@RequestMapping(value="/point/list")
	public String pointlist(Model model) {
		logger.info("포인트 내역 조회 페이지");
		List<PointDTO> list = pointservice.list();
		logger.info("1");
		model.addAttribute("list", list);
		logger.info("포인트 :{}",list);
		return "mypage/point";
	}
	
	// 포인트 충전
	@PostMapping(value="/point/charge.do")
	public String charge(PointDTO chargeDTO, HttpSession session) {

		session.getAttribute("loginInfo");
		int result = pointservice.charge(chargeDTO);
		logger.info("결과 : {}",result);
		return "redirect:/point/list";
	}
}
