package com.gd.uspace.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.service.UserInfoService;

@Controller
public class UserinfoController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserInfoService userinfoservice;
	
	@RequestMapping(value="/userinfo", method = RequestMethod.GET)
	public String userinfo() {
		logger.info("회원 정보 조회 페이지");
		
		return "mypage/getuserinfo";
	}
	
	
//	public String userinfo(String id, String pw, String name, String phone, String gender, String email) {
//		logger.info("회원 정보 조회 페이지");
//		
//		//MemberDTO info = userinfoservice.userinfo(id,pw,name,phone,gender,email);
//		
//		
//		return "mypage/getuserinfo";
//	}
	
	
}
