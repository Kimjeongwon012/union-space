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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;

	// 사용자의 포인트 내역 조회 및 충전 시작
	@RequestMapping(value="/point/list.do")
	public String pointlist(Model model, HttpSession session) {
		logger.info("포인트 내역 조회 페이지");
		// String loginInfo = (String) session.getAttribute("user_id");
		List<MemberDTO> lastpoint = pointservice.lastpoint();
		logger.info("lastpoint:{}",lastpoint);
		model.addAttribute("lastpoint", lastpoint);
		
		return "mypage/point";
	}
	
	@ResponseBody
	@RequestMapping(value="/point/list.ajax", method = RequestMethod.POST)
	public Map<String, Object> pointAjax(int page, String sort, String state){
		logger.info("내역 요청");
		Map<String, Object> response = new HashMap<String, Object>();
		//페이징 처리된 포인트 내역
		List<PointDTO> list = pointservice.PointGet(page, sort, state);
		// 총 페이지 개수(필터링한 후 포함)
		int totalPages = pointservice.PointGetAllCount(page, sort, state);
		
		response.put("pointList", list);
		response.put("totalPages", totalPages);

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
		return "redirect:/point/list.do";
	}
	// 사용자의 포인트 내역 조회 및 충전 끝
	
	// 관리자 포인트 내역 조회 시작
	@RequestMapping(value="/point/adminpoint/list.go")
	public String adminPoint() {
		logger.info("관리자부분 포인트 내역 조회");
		return "mypage/adminPoint";
	}
	
	
	// 리스트 불러오기 - 비동기 방식
	@ResponseBody
	@RequestMapping(value="/adminpoint/list.ajax",method = RequestMethod.POST)
	public Map<String, Object> adminPointPg(int page, String sort, String state, String user_id){
		logger.info("사용자 포인트 내역 요청");
		Map<String, Object> map = new HashMap<String, Object>();
		// 페이징 처리된 포인트 내역
		List<PointDTO> userList = pointservice.UserPointList(page, sort, state, user_id);
		logger.info("조회 성공 - 데이터 수: {}", userList.size());
		// 총 페이지 개수
		int totalPages = pointservice.UserPointListAllCount(page, sort, state, user_id);
		
		map.put("userPointList",userList);
		map.put("totalPages", totalPages);
		
		return map;
	}
}