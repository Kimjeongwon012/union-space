package com.gd.uspace.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.gd.uspace.admin.dto.AdminDTO;
import com.gd.uspace.admin.service.AdminService;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	    
        // 페이지 번호와 페이지 크기를 파라미터에서 가져옴
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int pageSize = 10; // 페이지당 데이터 개수
        
        // 시작 인덱스 계산
        int start = (page - 1) * pageSize;
        
	    // 매개변수를 그대로 response에 복사
	    response.putAll(params);

	    logger.info("검색한 조건 출력 : " + response.toString());

	    // 서비스 레이어의 메서드 호출하여 검색 결과 가져오기
	    List<AdminDTO> search = adminService.selectAdminQna(params, start, pageSize);
	    logger.info("serach result : {}", search);
	    // 응답 데이터 구성
	    response.put("result", search);
	    response.put("success", true);

	    return response;
	}
	

	@PostMapping("/saveAnswer")
	@ResponseBody
	public Map<String, Object> saveAnswer(@RequestParam("answer") String answer, @RequestParam("questionNo") String questionNo) {
	    Map<String, Object> resultMap = new HashMap<>();
	    
	    // 서비스를 통해 답변을 DB에 저장
	    adminService.saveAnswer(answer, questionNo);
	    
	    // 저장 결과를 클라이언트에 전달
	    resultMap.put("success", true); // 성공했을 경우 true를 전달
	    return resultMap;
	}
	
	
	//adminMain page 요청
	@RequestMapping(value = "/adminMain")
	public String adminMain(Model model) {
//		logger.info("관리자 메인 페이지 요청");
	    List<AdminDTO> list = adminService.adminMain_list(); 
	    model.addAttribute("adminMain_list", list);
	    return "admin/adminMain";
	}
	
    // AJAX를 이용하여 예약(모임)내역 필터링된 데이터 가져오기
    @RequestMapping(value = "/adminMain/ajax")
    @ResponseBody
    public Map<String, Object> adminMainSearch(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();
        
        // 페이지 번호와 페이지 크기를 파라미터에서 가져옴
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int pageSize = 10; // 페이지당 데이터 개수
        
        // 시작 인덱스 계산
        int start = (page - 1) * pageSize;
        
        // 매개변수를 그대로 response에 복사
        response.putAll(params);
//        logger.info("검색한 조건 출력 : " + response.toString());

        // 서비스 레이어의 메서드 호출하여 검색 결과 가져오기
        List<AdminDTO> search = adminService.selectAdminMain(params, start, pageSize);
//        logger.info("search result : {}", search);
        // 응답 데이터 구성
        response.put("result", search);
        response.put("success", true);

        return response;
    }
    
    //adminSpaceReview page 요청
	@RequestMapping(value = "/adminSpaceReview")
	public String adminSpaceReview(Model model) {
		logger.info("관리자 장소별리뷰 페이지 요청");  
	    List<AdminDTO> list = adminService.adminSpaceReview_list();    
	    model.addAttribute("adminSpaceReview_list", list);
	  
	    return "admin/adminSpaceReview";
	}
	
	// AJAX를 이용하여 장소별리뷰 필터링된 데이터 가져오기
    @RequestMapping(value = "/admin/adminSpaceReviewSerch.ajax")
    @ResponseBody
    public Map<String, Object> adminSpaceReviewSerch(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();
        // 페이지 번호와 페이지 크기를 파라미터에서 가져옴
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int pageSize = 10; // 페이지당 데이터 개수
        
        // 시작 인덱스 계산
        System.out.println(page);
        int start = (page - 1) * pageSize;
        
        // 매개변수를 그대로 response에 복사
        response.putAll(params);
        // logger.info("검색한 조건 출력 : " + response.toString());

        List<AdminDTO> search = adminService.adminSpaceReviewSerch(params, start, pageSize);
        // logger.info("search result : {}", search);

        System.out.println(search.toString());
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
	
	/* 관리자 - 회원목록조회 시작 */
	@RequestMapping(value="/admin/get.do")
	public String userlist() {
		logger.info("회원 목록 조회 관리자 페이지");
		return "admin/adminUserList";
	}

	/* 관리자 - 회원목록조회 끝 */



}