package com.gd.uspace.main.controller;

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

import com.gd.uspace.main.service.MainService;
import com.gd.uspace.member.dto.MemberDTO;

@Controller
public class MainController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService service;
	
	@RequestMapping(value="/", method = RequestMethod.GET) 
	public String index(){  
		return "index"; 
	}
	
	//최초 메인페이지 요청
	@RequestMapping(value="/home")
	public String home(Model model, HttpSession session) {
		logger.info("최초 메인페이지 요청");
		String user_id = null;
		if (session.getAttribute("loginInfo") != null) {
			user_id = (String) session.getAttribute("loginInfo");
			MemberDTO memberDTO = service.getMemberDTO(user_id);
			model.addAttribute("memberDTO", memberDTO);
			logger.info("memberDTO : {}", memberDTO);
		}
		return "main/main";
	}
	
	// 마이페이지 요청	
		@RequestMapping(value="/mypagemain")
		public String mypage(){
			logger.info("마이페이지 요청");
			return "mypage/myPageMain";
		}
	// 문의게시판 요청
		@RequestMapping(value="/QnAList")
		public String QnA(){
			logger.info("문의게시판 요청");
			return "help/getQnAList";
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
	
}
