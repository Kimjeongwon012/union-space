package com.gd.uspace.main.controller;
import java.sql.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.uspace.admin.dto.AdminDTO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.main.dto.MainDTO;
import com.gd.uspace.main.service.MainService;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;

@Controller
public class MainController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService service;
	
	@RequestMapping(value="/", method = RequestMethod.GET) 

	public String index(){  
		return "redirect:/home"; 
	}
	
	//최초 메인페이지 요청
	@RequestMapping(value="/home")
	public String home(Model model, HttpSession session, String alert) {
		logger.info("최초 메인페이지 요청");
		String user_id = null;
		if (session.getAttribute("loginInfo") != null) {
			user_id = (String) session.getAttribute("loginInfo");
			MemberDTO memberDTO = service.getMemberDTO(user_id);
			model.addAttribute("memberDTO", memberDTO);
			logger.info("memberDTO : {}", memberDTO);
		}
		model.addAttribute("alert", alert);
		return "main/main";
	}
	
	// 마이페이지 요청 / 예약 현황 불러오기
		@RequestMapping(value="/mypagemain")
		public String mypage(HttpServletRequest request, Model model){

		    
		    // 세션에서 사용자 아이디 가져오기
		    HttpSession session = request.getSession();
		    String userId = (String) session.getAttribute("loginInfo"); // 세션에 저장된 userId 값 가져오기
		    
		    List<GroupDTO> list = service.mypage_list(userId);
		    model.addAttribute("mypage", list);
		    
		    // 사용자 정보를 가져와서 모델에 추가
		    int pointBalance = service.getPointBalance(userId);
		    int mannerScore = service.getMannerScore(userId);
		    double attendanceRate = service.getAttendanceRate(userId);
		    
		    model.addAttribute("userId", userId);
		    model.addAttribute("pointBalance", pointBalance);
		    model.addAttribute("mannerScore", mannerScore);
		    model.addAttribute("attendanceRate", attendanceRate);
		    
		    logger.info("마이페이지 요청");
		    return "mypage/myPageMain";
		}
	
		
	// 문의게시판 요청
		@RequestMapping(value="/QnAList")
		public String QnA(){
			logger.info("문의게시판 요청");
			return "help/qnaList";
		}

	@RequestMapping(value="/error/404")
	public String notFound(Model model) {
		model.addAttribute("code", "404");
		model.addAttribute("msg", "페이지 또는 요청 못찾음");
		return "error";
	}
	
	@RequestMapping(value="/error/500")
	public String serverError(Model model) {
		model.addAttribute("code", "500");
		model.addAttribute("msg", "서버 처리 중 문제 발생");
		return "error";
	}

	// 장소 및 모임 검색 결과 페이지 요청
	@RequestMapping(value="/searchResult.go")
	public String searchResultGo(@RequestParam Map<String, Object> params, Model model, HttpSession session) {
		logger.info("장소 및 모임 검색 결과 페이지 요청");
		logger.info("params : {}", params);
		model.addAttribute("name", params.get("name"));
		model.addAttribute("type", params.get("type"));
		String user_id = null;
		if (session.getAttribute("loginInfo") != null) {
			user_id = (String) session.getAttribute("loginInfo");
			MemberDTO memberDTO = service.getMemberDTO(user_id);
			model.addAttribute("memberDTO", memberDTO);
		}
		return "main/searchResult";
	}

	// 장소 및 모임 검색 결과 페이징 처리 요청
	@RequestMapping(value="/searchResult.ajax")
	@ResponseBody
	public Map<String, Object> searchResultAjax(@RequestParam Map<String, Object> params, 
		Model model, HttpSession session) {
		logger.info("장소 및 모임 검색 결과 페이징 처리 요청");
		logger.info("params : {}", params);
		Map<String, Object> response =  new HashMap<String, Object>();
		service.getResultList(params, response);
			
		return response;
	}
	
	// 출석체크 처리 요청
	@RequestMapping(value="/mypagemain/attenDance.ajax")
	@ResponseBody
	public Map<String, Object> mypagemainAttenDanceAjax(int group_no, Model model, HttpSession session) {
		logger.info("출석체크 처리 요청");
		logger.info("group_no : {}", group_no);
		String user_id = (String) session.getAttribute("loginInfo");
		Map<String, Object> response = new HashMap<String, Object>();
		service.addAttenDance(group_no, user_id, response);

		return response;
	}	
	
}
