package com.gd.uspace.reservation.controller;

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

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.reservation.service.ReservationService;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Controller
public class ReservationController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReservationService resService;
	
	/* 예약 내역 조회 페이지 시작 */
	
	// 예약 내역 조회 페이지 이동
	@RequestMapping(value="/reservation/get.do")
	public String resGet(Model model, HttpSession session) {
		logger.info("모임예약 내역 조회 부분");
		String id = "aa";  //테스트용 아이디 //테스트 끝나고 매개변수로 user_id로 받기
		//String id = (String) session.getAttribute("loginInfo");
		
		return "reservation/reservationGet";
	}
	
	// 예약 내역 불러오기 비동기
	@ResponseBody
	@RequestMapping(value="/reservation/list.ajax", method = RequestMethod.POST)
	public Map<String, Object> groupList(int page){
		logger.info("예약 내역 조회 페이지 요청");
		Map<String , Object> map = new HashMap<String, Object>();
		
		// 페이징 처리된 포인트 내역
		List<GroupDTO> GresList = resService.GetGoupList(page);
		List<GroupDTO> resList = resService.GetList(page);
		logger.info("조회 성공 - 데이터 수: {}", GresList.size());
		logger.info("조회 성공 - 데이터 수: {}", resList.size());
		
		// 총 페이지 개수
		int totalPages = resService.GroupAllCount();
		int TPages = resService.ResAllCount();
		
		// 이름을 jsp와 맞춰줘야함
		map.put("resgroupList", GresList);
		map.put("totalPages", totalPages);
		map.put("resList", resList);
		map.put("TPages", TPages);
		
		return map;
	}
	/*
	// 리뷰 작성
	@RequestMapping(value="/reservation/write-review.do", method = RequestMethod.POST)
	public String review(SpaceReviewDTO srDTO, @RequestParam Map<String, Object> param) {
		logger.info("리뷰작성 모달");
		resService.writeReview(srDTO, param);
		logger.info("param :{}",param);
		return "redirect:/reservation/get.do";
	}
	*/
	// 리뷰 작성
	@RequestMapping(value="/reservation/write-review.do")
	public String review(SpaceReviewDTO srDTO) {
		logger.info("리뷰작성 모달");
		resService.writeReview(srDTO);
		logger.info("작성된 리뷰:{}",srDTO);
		
		//logger.info("param :{}",param);
		return "redirect:/reservation/get.do";
	}
	
	
	/* 예약 내역 조회 페이지 끝 */
}
