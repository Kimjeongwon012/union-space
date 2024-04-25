package com.gd.uspace.group.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.service.GroupService;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupService groupservice;
	
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
	
	@RequestMapping(value="/group/paymentRegistration.do", method = RequestMethod.GET)
	public String groupRegistergo(Model model, HttpSession session) {
		logger.info("모임 등록 처리 요청");
		// 비회원은 로그인 페이지로 이동
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		String page = "/group/groupPaymentFail";
		// 세션에서 예약 정보가 담겨 있는지 확인한다
		if (session.getAttribute("group") != null) {
			GroupDTO groupDTO = (GroupDTO) session.getAttribute("group");
			if (groupservice.registerGroup(groupDTO)) { // 모임 등록 실패를 확인
				logger.info("모임 등록 성공");
				page = "/group/groupPaymentSuccess";
			} else {
				logger.info("모임 등록 실패");
				// 예약하려던 장소 페이지로 이동
				//return "/space/detail?space_no" + groupDTO.getSpace_no(); 
			}
			session.removeAttribute("group");
		} else { // 오류 발생으로 실패 페이지를 보여준다
			logger.info("모임 데이터가 없습니다");
			// 모임 등록 - 결제 사이의 오류 발생으로 메인 페이지로 이동한다 
		}
		return page;
	}
	
	@RequestMapping(value="/group/paymentRegistration.go", method = RequestMethod.POST)
	public String groupRegistergo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("모임 등록시 결제 확인 페이지 이동");
		logger.info("params : {}", params);
		Timestamp group_starttime = java.sql.Timestamp.valueOf(params.get("group_starttime"));
		Timestamp group_endtime = java.sql.Timestamp.valueOf(params.get("group_endtime"));
		//logger.info("group_starttime : {}",group_starttime);
		//logger.info("group_endtime : {}",group_endtime);
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
			page = "/group/groupPaymentRegistration";
			MemberDTO user = (MemberDTO) session.getAttribute("loginInfo");
			GroupDTO groupDTO = new GroupDTO();
			groupDTO.setSpace_no(Integer.parseInt(params.get("space_no")));
			groupDTO.setUser_id(user.getUser_id());
			groupDTO.setGroup_name(params.get("group_name"));
			groupDTO.setGroup_state("0");
			groupDTO.setGroup_create_date(new Date(System.currentTimeMillis()));
			groupDTO.setGroup_people(1); // 모임으로 예약하므로 1명이다
			groupDTO.setGroup_introduce(params.get("group_introduce"));
			groupDTO.setGroup_caution(params.get("group_caution"));
			groupDTO.setGroup_confirm(new Timestamp(group_starttime.getTime() - (3 * 24 * 60 * 60 * 1000)));
			groupDTO.setGroup_starttime(group_starttime);
			groupDTO.setGroup_endtime(group_endtime);
			groupDTO.setGroup_lowpeople(Integer.parseInt(params.get("group_lowpeople")));
			groupDTO.setGroup_highpeople(Integer.parseInt(params.get("group_highpeople")));
			logger.info("groupDTO : {}", groupDTO.toString());
			model.addAttribute("groupDTO", groupDTO);
			// 세션에 모임(예약) 정보를 담아둔다
			session.setAttribute("group", groupDTO);
		} else {
			page = "/member/login";
		}
		return page;
	}
	
	@RequestMapping(value="/group/groupRegister.go", method = RequestMethod.POST)
	public String groupRegisterdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("모임 등록 페이지 이동");
		logger.info("params : {}", params);

		String space_no =  params.get("space_no");
		String start_date =  params.get("start_date");
		String end_date =  params.get("end_date");
		String group_people = params.get("group_people");
		String page = "/member/login";
		if (session.getAttribute("loginInfo") != null) {
			SpaceDTO spaceDTO = groupservice.getSpaceInfo(space_no);
			MemberDTO user = (MemberDTO) session.getAttribute("loginInfo");
			model.addAttribute("spaceDTO", spaceDTO);
			model.addAttribute("start_date", start_date);
			model.addAttribute("end_date", end_date);
			model.addAttribute("group_people", group_people);
			model.addAttribute("user_id", user.getUser_id());
			page = "/group/groupRegistration";
		} else {
			page = "/member/login";
		}
		return page;
	}
}

