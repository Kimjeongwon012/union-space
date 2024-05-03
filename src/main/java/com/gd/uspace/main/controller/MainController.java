package com.gd.uspace.main.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.main.dto.MainDTO;
import com.gd.uspace.main.service.MainService;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;

@Controller
public class MainController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService mainservice;
	
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
			MemberDTO memberDTO = mainservice.getMemberDTO(user_id);
			model.addAttribute("memberDTO", memberDTO);
			logger.info("memberDTO : {}", memberDTO);
		}
		return "main/main";
	}
	
	// 마이페이지 요청 / 예약 현황 불러오기
		@RequestMapping(value="/mypagemain")
		public String mypage(Model model){
			List<GroupDTO> list = mainservice.mypage_list();
			model.addAttribute("mypage", list);
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

}
