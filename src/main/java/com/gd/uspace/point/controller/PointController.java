package com.gd.uspace.point.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;


	// 포인트 내역 출력
	@RequestMapping(value="/point/list")
	public String pointlist(Model model, HttpSession session) {
		logger.info("포인트 내역 조회 페이지");
		// String loginInfo = (String) session.getAttribute("user_id");
		// 아래 리스트 들은 로그인이 된 경우에만 확인 가능 
		// 나중에 if 문 사용해서 추가해야함
		List<PointDTO> list = pointservice.list();
		logger.info("1");
		model.addAttribute("list", list);
		logger.info("포인트 :{}",list);
		
		List<MemberDTO> lastpoint = pointservice.lastpoint();
		logger.info("lastpoint:{}",lastpoint);
		model.addAttribute("lastpoint", lastpoint);
		
		return "mypage/point";
	}
	
	// 포인트 충전
	@PostMapping(value="/point/charge.do")
	public String charge(PointDTO chargeDTO, HttpSession session, Model model, String user_id) {
		logger.info("충전 모달");
		
		pointservice.charge(chargeDTO);
		//pointservice.updatePoint(user_id,chargeDTO.getPoint_price());
		pointservice.updatePoint(chargeDTO.getPoint_price());
		return "redirect:/point/list";
	}
}
