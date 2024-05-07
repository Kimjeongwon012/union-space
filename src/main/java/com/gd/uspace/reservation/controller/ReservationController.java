package com.gd.uspace.reservation.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
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

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.reservation.dto.EvaluateListDTO;
import com.gd.uspace.reservation.service.ReservationService;

@Controller
public class ReservationController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReservationService resService;
	
	/* 예약 내역 조회 페이지 시작 */
	
	// 예약 내역 조회 페이지 이동
	@RequestMapping(value="/reservation/get.do")
	public String resGet(Model model, HttpSession session) {
		logger.info("모임예약 내역 조회 부분");
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/login.go";
		}
		return "reservation/reservationGet";
	}
	
	// 예약 내역 불러오기 비동기
	@ResponseBody
	@RequestMapping(value="/reservation/list.ajax", method = RequestMethod.POST)
	public Map<String, Object> groupList(int page, String sort, HttpSession session){
		logger.info("예약 내역 조회 페이지 요청 page : {}, sort : {}", page, sort);
		String user_id = (String) session.getAttribute("loginInfo");
		Map<String , Object> map = new HashMap<String, Object>();

		// 페이징 처리된 포인트 내역
		List<GroupDTO> GresList = resService.GetGoupList(user_id, page, sort);
		List<GroupDTO> resList = resService.GetList(user_id, page, sort);
		
		// 총 페이지 개수// 총 페이지 개수
	    int totalPages = resService.GroupAllCount(user_id);
		int TPages = resService.ResAllCount(user_id);
		//logger.info("totalPages : {}", totalPages);
		//logger.info("TPages : {}", TPages);
		
		// 이름을 jsp와 맞춰줘야함
		map.put("resgroupList", GresList);
		map.put("totalPages", totalPages);
		map.put("resList", resList);
		map.put("TPages", TPages);
		
		return map;
	}

	// 리뷰 작성
	@RequestMapping(value="/reservation/write-review.do")
	public String review(@RequestParam Map<String,String> params) {
		logger.info("리뷰작성 모달");
		logger.info("작성된 리뷰:{}", params);
		resService.writeReview(params);
		
		//logger.info("param :{}",param);
		return "redirect:/reservation/get.do";
	}
	
	// 팀원 평가 처리 요청
	@RequestMapping(value="/reservation/evaluateMember.do")
	public String evaluateMemberDo(@RequestParam Map<String,String> params, @RequestParam int[] evaluationList) {
		logger.info("팀원 평가 처리 요청");
		logger.info("params:{}", params);
		logger.info("evaluationList : {}", evaluationList);
		resService.insertEvaluate(params, evaluationList);
		return "redirect:/reservation/get.do";
	}

	
	// 모임원 평가 요청 처리
	@RequestMapping(value="/reservation/evaluateList.ajax")
	@ResponseBody
	public Map<String, Object> evaluateListAjax(String group_no, HttpSession session) {
		logger.info("모임원 평가 모달");
		String user_id = (String) session.getAttribute("loginInfo");
		Map<String, Object> response =  new HashMap<String, Object>();
		logger.info("group_no :{}", group_no);
		List<EvaluateListDTO> evaluateList = resService.getEvaluateList(group_no, user_id);
		
		response.put("evaluateList", evaluateList);
		return response;
	}
	
	// 모임원 평가 항목 불러오기 
	@RequestMapping(value="/reservation/evaluateItemList.ajax")
	@ResponseBody
	public Map<String, Object> evaluateItemListAjax() {
		logger.info("모임원 평가 항목 불러오기");
		Map<String, Object> response =  new HashMap<String, Object>();
		Map<Integer,String> items = resService.getEvaluateItemList();
		
		response.put("items", items);
		return response;
	}
	
	/* 예약 내역 조회 페이지 끝 */
}
