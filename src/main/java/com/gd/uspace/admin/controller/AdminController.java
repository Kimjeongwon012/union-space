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
	
	
	//adminMain page 요청
	@RequestMapping(value = "/adminMain")
	public String adminMain(Model model) {
		logger.info("관리자 메인 페이지 요청");
	    List<AdminDTO> list = adminService.adminMain_list(); 
	    model.addAttribute("adminMain_list", list);
	    return "admin/adminMain";
	}
	
    // AJAX를 이용하여 예약(모임)내역 필터링된 데이터 가져오기
    @RequestMapping(value = "/adminMain/ajax")
    @ResponseBody
    public Map<String, Object> adminMainSearch(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();
        
        // 매개변수를 그대로 response에 복사
        response.putAll(params);
        logger.info("검색한 조건 출력 : " + response.toString());

        // 서비스 레이어의 메서드 호출하여 검색 결과 가져오기
        List<AdminDTO> search = adminService.selectAdminMain(params);
        logger.info("search result : {}", search);
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
    @RequestMapping(value = "/adminSpaceReviewSerch/ajax")
    @ResponseBody
    public Map<String, Object> adminSpaceReviewSerch(@RequestParam Map<String, String> params,
											    	 @RequestParam("pageNo") int pageNo,
											         @RequestParam("pageSize") int pageSize) {
        HashMap<String, Object> response = new HashMap<>();
        
        response.putAll(params);
        logger.info("검색한 조건 출력 : " + response.toString());

        // 전체 데이터 개수
        int totalCount = adminService.countAdminSpaceReviews(params);
        
        // 첫페이지와 총페이지를 계산
        int startpages = (pageNo - 1) * pageSize;
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        
        // 특정 페이지에 해당하는 데이터를 검색
        List<AdminDTO> searchResults = adminService.findAdminSpaceReviews(params, startpages, pageSize);

        // 응답 데이터
        response.put("result", searchResults); // 현재 페이지의 데이터
        response.put("totalPages", totalPages); // 전체 페이지 수
        response.put("currentPage", pageNo); // 현재 페이지 번호
        response.put("totalElements", totalCount); // 전체 데이터 개수
        response.put("success", true); // 성공 여부
        
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