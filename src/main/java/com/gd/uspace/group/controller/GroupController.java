package com.gd.uspace.group.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
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
		return "/main/header&sidemenu";
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
	
	// 모임 등록 처리 요청
	@RequestMapping(value="/group/paymentRegistration.do", method = RequestMethod.POST)
	public String registergo(Model model, HttpSession session) {
		logger.info("모임 등록 처리 요청");
		// 비회원은 로그인 페이지로 이동
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		// 세션에서 예약 정보가 담겨 있는지 확인한다
		} else if (session.getAttribute("groupDTO") != null) {
			GroupDTO groupDTO = (GroupDTO) session.getAttribute("groupDTO");
			
			// 데이터베이스에 모임 정보를 등록한다
			groupservice.registerGroup(groupDTO);
			session.removeAttribute("groupDTO");
			return "/group/paymentSuccess";
		}
		return "/group/paymentFail";
	}
	
	// 모임 등록에 대한 요청 처리 - 
	@RequestMapping(value="/group/paymentRegistration.go", method = RequestMethod.POST)
	public String registergo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("모임 등록시 결제 확인 페이지 이동");
		// 로그인 하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		// 모임 시작, 종료 시간을 각 변수에 저장한다
		Timestamp group_starttime = java.sql.Timestamp.valueOf(params.get("group_starttime"));
		Timestamp group_endtime = java.sql.Timestamp.valueOf(params.get("group_endtime"));
		
		MemberDTO user = (MemberDTO) session.getAttribute("loginInfo");
		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setSpace_no(Integer.parseInt(params.get("space_no")));
		groupDTO.setUser_id(user.getUser_id());
		groupDTO.setGroup_name(params.get("group_name"));
		groupDTO.setGroup_state("0"); // 모임의 상태는 모집중이다
		groupDTO.setGroup_create_date(new Date(System.currentTimeMillis()));
		groupDTO.setGroup_people(1); // 모임 등록시 인원 수를 1명으로 지정한다 
		groupDTO.setGroup_introduce(params.get("group_introduce")); 
		groupDTO.setGroup_caution(params.get("group_caution"));
		groupDTO.setGroup_confirm(new Timestamp(group_starttime.getTime() - (3 * 24 * 60 * 60 * 1000))); // 예약 확정 날짜는 모임 날짜 3일전이므로 그만큼 빼준다
		groupDTO.setGroup_starttime(group_starttime);
		groupDTO.setGroup_endtime(group_endtime);
		groupDTO.setGroup_lowpeople(Integer.parseInt(params.get("group_lowpeople")));
		groupDTO.setGroup_highpeople(Integer.parseInt(params.get("group_highpeople")));
		model.addAttribute("groupDTO", groupDTO);
		
		// 세션에 모임(예약) 정보를 담아둔다
		session.setAttribute("groupDTO", groupDTO);
		return "/group/paymentRegistration";
	}
	
	// 모임 등록 페이지 이동
	@RequestMapping(value="/group/register.go", method = RequestMethod.POST)
	public String registerdo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("모임 등록 페이지 이동");
		
		// 로그인 하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		String space_no =  params.get("space_no");
		String start_date =  params.get("start_date");
		String end_date =  params.get("end_date");
		String group_people = params.get("group_people"); 
				
		SpaceDTO spaceDTO = groupservice.getSpaceInfo(space_no);
		MemberDTO user = (MemberDTO) session.getAttribute("loginInfo");
		model.addAttribute("spaceDTO", spaceDTO);
		model.addAttribute("start_date", start_date);
		model.addAttribute("end_date", end_date);
		model.addAttribute("group_people", group_people);
		model.addAttribute("user_id", user.getUser_id());
		return "/group/registration";
	}
	
	// 모임 등록 페이지 이동
	@RequestMapping(value="/group/detail.go", method = RequestMethod.GET)
	public String detailgo(int group_no, Model model, HttpSession session) {
		logger.info("모임 상세보기 페이지 이동");
		logger.info("group_no : {}", group_no);
		// 모임의 상세 정보를 groupDTO 에 저장한다
		GroupDTO groupDTO = groupservice.getGroupInfo(group_no);
		// 모임장을 제외한 모임 인원 목록을 groupMemberList 에 저장한다
		List<MemberDTO> groupMemberList = groupservice.getGroupMemberList(group_no);
		// 모임장의 정보를 groupRegistrant 에 저장한다
		MemberDTO groupRegistrant = groupservice.getGroupRegistrant(group_no);
		logger.info("groupDTO : {}, groupMemberList : {}", groupDTO, groupMemberList);
		logger.info("groupRegistrant : {}",groupRegistrant);
		// 예역 확정날짜까지 D-DAY 날짜 계산
		int dDay = groupservice.getdDay(group_no);
		// 모델에다가 뿌린다
		model.addAttribute("groupDTO", groupDTO);
		model.addAttribute("groupMemberList", groupMemberList);
		model.addAttribute("groupRegistrant", groupRegistrant);
		model.addAttribute("dDAY", dDay);
		return "/group/detail";
	}
}

