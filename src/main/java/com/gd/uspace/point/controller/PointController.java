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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;

	@RequestMapping(value="/point/list")
	public String pointlist(Model model, HttpSession session) {
		logger.info("포인트 내역 조회 페이지");
		// String loginInfo = (String) session.getAttribute("user_id");
		List<MemberDTO> lastpoint = pointservice.lastpoint();
		logger.info("lastpoint:{}",lastpoint);
		model.addAttribute("lastpoint", lastpoint);
		
		return "mypage/point";
	}
	
	@ResponseBody
	@RequestMapping(value="/point/list.ajax")
	public Map<String, Object> AjaxRequest(@RequestParam Map<String, String> param){
		logger.info("내역 요청");
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		response.putAll(param);
		
		logger.info("필터 출력:{}",response.toString());

		// 검색결과
		List<PointDTO> searchResult = pointservice.selectResult(param);
		logger.info("result :{}",searchResult);
		response.put("result", searchResult);
		return response;
	}
	
	
	// 포인트 충전
	@PostMapping(value="/point/charge.do")

	public String charge(PointDTO chargeDTO, int point_price, HttpSession session, Model model, String user_id) {
		logger.info("충전 모달");
		logger.info("point_price : {}", point_price);
	    // 포인트 충전 로직 실행
		pointservice.charge(point_price);
		
		// 사용자 포인트 
		//pointservice.updatePoint(user_id,chargeDTO.getPoint_price());
		pointservice.updatePoint(chargeDTO.getPoint_price());
		return "redirect:/point/list";
	}
}