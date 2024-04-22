package com.gd.uspace.group.controller;

import java.sql.Date;
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

import com.gd.uspace.group.service.GroupService;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupService groupservice;
	
	@RequestMapping(value="/group/register")
	public String groupRegistration() {
		logger.info("모임 등록 페이지 이동");
		return "/group/groupRegistration";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		logger.info("테스트 페이지 이동");
		return "header&sidemenu";
	}
	
	@RequestMapping(value="/forceLogin.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> pagingBoardListAjax(HttpSession session) {
		logger.info("강제 로그인/로그아웃 요청");
		Map<String, Object> result = new HashMap<String, Object>();
		if (session.getAttribute("loginInfo") != null) {
			session.removeAttribute("loginInfo"); // 해당 사용자를 로그아웃 상태로 변경
		} else { 
			MemberDTO user = new MemberDTO();
			user.setUser_id("aa");
			user.setUser_pw("1234");
			session.setAttribute("loginInfo", user); // 해당 사용자를 로그인 상태로 변경
		}
		logger.info("null 시 로그아웃 : {}", session.getAttribute("loginInfo"));
		return result;
	}
	
	
	@RequestMapping(value="/space/groupRegister.go")
	public String groupRegistergo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("모임 등록 페이지 이동");
		logger.info("{}", params);
		String space_no =  params.get("space_no");
		String start_date =  params.get("start_date");
		String end_date =  params.get("end_date");
		String group_people = params.get("group_people");
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
			page = "/group/groupRegistration";
			SpaceDTO spaceDTO = groupservice.getSpaceInfo(space_no);
			MemberDTO user = (MemberDTO) session.getAttribute("loginInfo");
			model.addAttribute("spaceDTO", spaceDTO);
			model.addAttribute("start_date", start_date);
			model.addAttribute("end_date", end_date);
			model.addAttribute("group_people", group_people);
			model.addAttribute("user_id", user.getUser_id());
		} else {
			page = "/member/login";
		}
		return page;
	}
	
	@RequestMapping(value="/space/groupRegister.do")
	public String groupRegisterdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("모임 등록 처리 요청");
		logger.info("{}", params);
		logger.info("{}", new Date(Date.parse(params.get("group_starttime"))));
		logger.info("{}", new Date(Date.parse(params.get("group_endtime"))));
		groupservice.registerGroup(params);
		return "/group/groupPaymentRegistration";
	}
}
