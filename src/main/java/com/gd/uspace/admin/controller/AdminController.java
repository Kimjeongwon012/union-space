package com.gd.uspace.admin.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.uspace.admin.dto.AdminDTO;
import com.gd.uspace.admin.service.AdminService;


@Controller
public class AdminController {
	
	@Autowired AdminService adminService ;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	//최초 메인페이지 요청
	@RequestMapping(value="/")
	public String home() {
	logger.info("최초 메인페이지 요청");
	return "index";
	}
	
	//관리자QnA 목록 불러오기
	@RequestMapping(value="/adminQna")
	public String adminQna_list(Model model, 
			HttpSession session,
			@RequestParam(required=false, value="page")String page,
			@RequestParam(required=false, value="state")String state,
			@RequestParam(required=false, value="space_no")String space_no,
			@RequestParam(required=false, value="sort")String sort
			) {
		HashMap<String,String> data = new HashMap<String,String>();
			data.put("page", page); 
			data.put("state", state); 
			data.put("space_no",space_no); 
			data.put("sort", sort);
			
		System.out.println("data:" + data.toString());
		
		List<AdminDTO> list = adminService.adminQna_list(data);
		model.addAttribute("adminQna_list", list);
		
		System.out.println("list" + list.toString());
		
		return "admin/adminQna";
	}
	
	
	@RequestMapping(value="/group/register", method = RequestMethod.GET) public String index()
	{ logger.info("모임 등록 페이지"); return "group/groupRegistration"; }

	@RequestMapping(value="/sample", method = RequestMethod.GET) 
	public String sample() { 
		logger.info("샘플 페이지 이동"); return "group/sample"; 
	}

}