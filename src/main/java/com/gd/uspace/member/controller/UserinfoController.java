package com.gd.uspace.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.UserInfoDTO;
import com.gd.uspace.member.service.UserInfoService;

@Controller
public class UserinfoController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserInfoService userinfoservice;
	
	@RequestMapping(value="/userinfo", method = RequestMethod.GET)
	public String userinfo(HttpSession session, Model model) {
		logger.info("회원 정보 조회 페이지");
		
		String userId = (String) session.getAttribute("user_id");
		
		UserInfoDTO userInfo = userinfoservice.getUserInfo(userId); 

	    // 모델에 사용자 정보 추가
	    model.addAttribute("user_id", userInfo.getUser_id());
	    model.addAttribute("user_pw", userInfo.getUser_pw());
	    model.addAttribute("user_name", userInfo.getUser_name());
	    model.addAttribute("user_phone", userInfo.getUser_phone());
	    model.addAttribute("user_gender", userInfo.getUser_gender());
	    model.addAttribute("user_email", userInfo.getUser_email());
		
		return "mypage/getuserinfo";
	}
	
	@RequestMapping(value="/userEdit", method = RequestMethod.GET)
	public String userEdit() {
	    logger.info("회원 정보 수정 페이지로 이동");
	    return "mypage/userEdit"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	@RequestMapping(value="/pwChange", method = RequestMethod.GET)
	public String pwChange() {
	    logger.info("회원 정보 수정 페이지로 이동");
	    return "mypage/pwChange"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	
	
}
