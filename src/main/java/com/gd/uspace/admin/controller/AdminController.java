package com.gd.uspace.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.gd.uspace.admin.dto.AdminDTO;
import com.gd.uspace.admin.service.AdminService;


public class AdminController {


	@Autowired
	AdminService adminService;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 최초 메인페이지 요청
	@RequestMapping(value = "/")
	public String home() {
		logger.info("최초 메인페이지 요청");
		return "index";
	}

	
	// 모든 QnA 목록 가져오기
	@RequestMapping(value = "/adminQna")
	public String adminQnaList(Model model) {
	    List<AdminDTO> list = adminService.adminQna_list(); 
	    model.addAttribute("adminQna_list", list);
	    return "admin/adminQna";
	}


	// 서버에서 필터링한 데이터 가져와서 - 필터링한 값으로 조회하기
	@RequestMapping(value = "/adminQna/ajax")
	@ResponseBody
	public Map<String, Object> adminQnaSearch(@RequestParam Map<String, String> params) {
	    HashMap<String, Object> response = new HashMap<>();
	    
	    // 매개변수를 그대로 response에 복사
	    response.putAll(params);

	    logger.info("검색한 조건 출력 : " + response.toString());

	    // 서비스 레이어의 메서드 호출하여 검색 결과 가져오기
	    List<AdminDTO> search = adminService.selectAdminQna(params);
	    logger.info("serach result : {}", search);
	    // 응답 데이터 구성
	    response.put("result", search);
	    response.put("success", true);

	    return response;
	}

	@RequestMapping(value = "/group/register", method = RequestMethod.GET)
	public String index() {
		logger.info("모임 등록 페이지");
		return "group/groupRegistration";
	}

	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sample() {
		logger.info("샘플 페이지 이동");
		return "group/sample";
	}
}