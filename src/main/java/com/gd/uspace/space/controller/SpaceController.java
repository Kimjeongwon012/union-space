package com.gd.uspace.space.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceImageDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;
import com.gd.uspace.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired SpaceService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 장소 등록 페이지 이동
	@RequestMapping(value="/spaceWriteForm", method = RequestMethod.GET)
	public String registerForm() throws IOException {
//		logger.info("장소 등록 Form");
		return "/space/spaceWriteForm";
	}
	
	// 장소 등록
	@RequestMapping(value="/space/register", method = RequestMethod.POST)
	public String addSpace(MultipartFile mainPhoto, MultipartFile[] photos, @RequestParam Map<String,String>param, HttpSession session, Model model) {
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

	
	@Autowired SpaceService spaceservice;
	
	@RequestMapping(value="/space/register", method = RequestMethod.GET)
	public String index() {
		logger.info("indexController");
		return "/space/spaceCreate";
	}
	
	// 장소 상세보기 페이지 이동
	@RequestMapping(value="/space/detail.go", method = RequestMethod.GET)
	public String spaceDetailgo(Model model, int space_no, HttpSession session) {
		logger.info("장소 상세보기 페이지 이동");
		SpacePageDTO spacepageDTO = spaceservice.getSpacePage(space_no);
		model.addAttribute("spacePage", spacepageDTO);
		model.addAttribute("space_no", space_no);
		return "/space/spaceDetail";
	}
	
	// 질문 작성 페이지 이동
	@RequestMapping(value="/space/writeQnaForm.go", method = RequestMethod.POST)
	public String writeQnaFormgo(int space_no, Model model, HttpSession session) {
		logger.info("장소 질문 작성 페이지 이동");
		String page = "/member/login";
		// 로그인 상태 확인
		if (session.getAttribute("loginInfo") != null) {
	        // 현재 날짜를 가져오기
	        LocalDateTime now = LocalDateTime.now();
	        
	        // 현재 날짜를 Timestamp로 변환하여 출력
	        Timestamp timestamp = Timestamp.valueOf(now);
	        SimpleDateFormat foramt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			model.addAttribute("writer", session.getAttribute("loginInfo"));
			model.addAttribute("write_date", foramt.format(timestamp));
			model.addAttribute("space_no", space_no);
			page = "/space/spaceQnaWriteForm";
		}
		return page;
	}

	// 질문 작성 요청 처리
	@RequestMapping(value="/space/writeQnaForm.do", method = RequestMethod.POST)
	public String writeQnaFormdo(int space_no, String question_content, Model model, HttpSession session) {
		logger.info("장소 질문 작성 요청 처리");
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
		String user_id = memberDTO.getUser_id();
		// space_no 번 장소의 질문 추가한다
		spaceservice.insertQuestion(space_no, user_id, question_content);
		return "redirect:/space/detail.go?space_no=" + space_no;
	}
	
	// 예약 요청 처리
	@RequestMapping(value="/space/reservation.go", method = RequestMethod.POST)
	public String reservationdo(@RequestParam Map<String,String> params,
			Model model, HttpSession session) {
		logger.info("장소 예약 처리 요청");
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

	// 결제 성공 페이지
	@RequestMapping(value="/space/reservation/pay.do")
	public String paySuccess() {
		logger.info("결제 성공 페이지");
		return "/space/spacePaymentSuccess";
	}
	// 리뷰 페이징 요청 처리
	@RequestMapping(value="/space/reviewPagination.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewPaginationAjax(int space_no, int page, String sort) {
		logger.info("페이징 처리된 리뷰 목록 데이터 반환");
		Map<String, Object> response =  new HashMap<String, Object>();
		// 페이징 처리된 리뷰 목록
		List<SpaceReviewDTO> list = spaceservice.getSpaceReview(space_no, page, sort);
		// 총 페이지 수
		int totalPages = spaceservice.getReviewAllPageCount();
		
		response.put("reviewList", list);
		response.put("totalPages", totalPages);
		return response;
	}
	
	// QnA 페이징 요청 처리
	@RequestMapping(value="/space/qnaPagination.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> qnaPaginationAjax(int space_no, int page, String sort) {
		logger.info("페이징 처리된 QnA 목록 데이터 반환");
		Map<String, Object> response =  new HashMap<String, Object>();
		// 페이징 처리된 QnA 목록
		List<SpaceQuestionDTO> list = spaceservice.getSpaceQna(space_no, page, sort);
		int totalPages = spaceservice.getQnaAllPageCount();
		response.put("questionList", list); // 답변은 questionList 안에 spaceAnswerDTO 로 접근할 수 있다
		response.put("totalPages", totalPages);
		return response;

	}
	// 장소 수정페이지 이동
	@RequestMapping(value="/space/update.go", method = RequestMethod.GET)
	public String editGo(Integer space_no, Model model, HttpSession session) {
		logger.info("장소 수정 페이지 이동");
		
		SpaceDTO spaceupdate = service.getSpaceById(space_no);
		model.addAttribute("space", spaceupdate);
		return "space/spaceUpdateForm";
	}

}
