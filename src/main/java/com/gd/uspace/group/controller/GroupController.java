package com.gd.uspace.group.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.member.dto.MemberDTO;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/group/register.go")
	public String groupRegistration() {
		logger.info("모임 등록 페이지 이동");
		return "/group/groupRegistration";
	}
	
	@RequestMapping(value="/forceLogin.ajax")
	@ResponseBody
	public Map<String, Object> forceLoginAjax(HttpSession session) {
		logger.info("강제 로그인/로그아웃");
		MemberDTO loginInfo = new MemberDTO();
		loginInfo.setUser_id("aa");
		if (session.getAttribute("loginInfo") != null) {
			session.removeAttribute("loginInfo");
		} else {
			session.setAttribute("loginInfo", loginInfo);
		}
		logger.info("loginInfo : {}", session.getAttribute("loginInfo"));
		Map<String, Object> result = new HashMap<String, Object>();
		return result;
	}
	

	@RequestMapping(value="/group/groupRegister.do", method = RequestMethod.POST)
	public String groupRegisterdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("모임 등록 처리 요청");
		logger.info("{}", params);
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
			
			logger.info("모임 등록 페이지로 이동");
			page = "/group/groupRegistration";
		} else {
			page = "/member/login";
		}
		return page;
	}
	
	@RequestMapping(value="/test")
	public String test() {
		logger.info("테스트 페이지 이동");
		return "header&sidemenu";
	}
}

