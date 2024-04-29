package com.gd.uspace.space.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;

import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired SpaceService service;
	@Autowired SpaceService spaceservice;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 장소 등록 페이지 이동
	@RequestMapping(value="/space/register.go", method = RequestMethod.GET)
	public String goSpaceForm(){
		logger.info("장소 등록 Form");
		return "/space/spaceWriteForm";
	}
	
	// 장소 상세보기 페이지 이동
	@RequestMapping(value="/space/detail", method = RequestMethod.GET)
	public String spaceDetailgo(Model model, int space_no) {
		logger.info("장소 상세보기 페이지 이동");
		SpacePageDTO spacepageDTO = spaceservice.getSpacePage(space_no);
		model.addAttribute("spacePage", spacepageDTO);
		model.addAttribute("space_no", space_no);
		return "/space/spaceDetail";
	}
//	------------------------------------------------------------------------------------------------
	
	// 장소 삭제
//	@RequestMapping(value="/space/delete", method = RequestMethod.POST)
//	public Map<String, Object> delSpace(@RequestParam(value="delList[]") List<String> spaces) {
//		int cnt = service.delSpace(spaces);
//		Map<String, Object> result = new HashMap<String, Object>();
//		result.put("deletedCnt", cnt);
//		
//		return result;
//	}
//	
	
	// 장소 목록 조회 페이지 이동
	@RequestMapping(value="/space/list.go", method = RequestMethod.GET)
	public String goSpaceList() throws IOException  {
		String page = "/admin/adminSpaceList";
		return page;
	}
	// 장소 목록 조회
	@ResponseBody
	@RequestMapping(value="/space/list/get", method = RequestMethod.GET)
	public Map<String, Object> getSpaceList() {
		logger.info("장소 목록 조회 Controller");
		
		List<SpaceDTO> list= service.getSpaceList();
		logger.info("list size : "+list.size());
//		logger.info("list : "+list);	
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("spaceList", list);
		
		return result;
	}

		
	// 장소 등록
	@RequestMapping(value="/space/register", method = RequestMethod.POST)
	public String addSpace(MultipartFile mainPhoto, MultipartFile[] photos, @RequestParam Map<String,String>param) {
		logger.info("장소 등록 Controller"); 
		logger.info("param: "+param);
		logger.info("대표 사진: "+mainPhoto);
		logger.info("업체 사진: "+photos);
		
		int result = service.addSpace(param, mainPhoto, photos);
		if(result > 1) {
			logger.info("장소 등록 최종 완료");
		}		
		return "/space/spaceWriteForm"; 
	}

	
	// 장소 예약 처리 요청
	@RequestMapping(value="/space/reservation.go", method = RequestMethod.POST)
	public String reservationdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("예약 처리 요청");
		logger.info("{}", params);
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
			
			logger.info("예약 확인 페이지로 이동");
			page = "/space/spacePayment";
		} else {
			page = "/member/login";
		}
		return page;
	}
}
