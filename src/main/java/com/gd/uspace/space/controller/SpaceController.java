package com.gd.uspace.space.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;
import com.gd.uspace.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired SpaceService service;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 장소 목록 조회 페이지 이동
	@RequestMapping(value="/space/list", method = RequestMethod.GET)
	public String goSpaceList() {
		String page = "/admin/adminSpaceList";
		return page;
	}
	
	// 장소 등록 페이지 이동
	@RequestMapping(value="/space/register.go", method = RequestMethod.GET)
	public String goSpaceWriteForm(){
		logger.info("장소 등록 Form");
		return "/space/spaceWriteForm";
	}
	
	
	// 장소 상세보기 페이지 이동
	@RequestMapping(value="/space/detail", method = RequestMethod.GET)
	public String spaceDetailgo(Model model, int space_no) {
		logger.info("장소 상세보기 페이지 이동");
		SpacePageDTO spacepageDTO = service.getSpacePage(space_no, model);
		model.addAttribute("spacePage", spacepageDTO);
		model.addAttribute("space_no", space_no);
		return "/space/spaceDetail";
	}
//	------------------------------------------------------------------------------------------------
	
	// 장소 삭제
	@ResponseBody
	@RequestMapping(value="/space/delete", method = RequestMethod.POST)
	public Map<String, Object> delSpace(String idx) {
		logger.info("장소 삭제 Controller");
		int space_no = Integer.parseInt(idx);
		logger.info("장소 삭제 idx: "+idx);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("msg", service.deleteSpace(space_no));
		
		return result;
	}

	// 장소 상태 변경
	@ResponseBody
	@RequestMapping(value="/space/updateState", method = RequestMethod.POST)
	public Map<String, Object> updateSpaceState(String idx, String state) {
		logger.info("장소 상태 변경 Controller");
		int space_no = Integer.parseInt(idx);
		int status = Integer.parseInt(state);
		logger.info("idx: "+idx+" / state: "+state);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("msg", service.updateSpaceState(space_no, status));
		
		return result;
	}
		
	// 장소 등록 처리 요청
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

	// 장소 상세보기 페이지 이동
	@RequestMapping(value="/space/detail.go", method = RequestMethod.GET)
	public String spaceDetailgo(Model model, int space_no, HttpSession session) {
		logger.info("장소 상세보기 페이지 이동");
		SpacePageDTO spacepageDTO = service.getSpacePage(space_no, model);
		
		// 장소 사진, 상세정보, 운영시간을 담은 spacepageDTO 페이지로 넘긴다
		model.addAttribute("spacePage", spacepageDTO);
		model.addAttribute("space_no", space_no);
		return "/space/spaceDetail";
	}
	
	// 질문 작성 페이지 이동
	@RequestMapping(value="/space/writeQnaForm.go", method = RequestMethod.POST)
	public String writeQnaFormgo(int space_no, Model model, HttpSession session) {
		logger.info("장소 질문 작성 페이지 이동");
		// 로그인하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/login.go";
		} 
        LocalDateTime now = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(now);
        SimpleDateFormat foramt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        
        // 작성 페이지에서 작성자의 아이디와 작성 날짜를 보여주기 위해 페이지로 넘긴다
		model.addAttribute("writer", session.getAttribute("loginInfo"));
		model.addAttribute("write_date", foramt.format(timestamp));
		model.addAttribute("space_no", space_no);
		return "/space/spaceQnaWriteForm";
	}

	// 장소 목록 조회
	@ResponseBody
	@RequestMapping(value="/space/list/get", method = RequestMethod.GET)
	public Map<String, Object> getSpaceList(String page) {
		logger.info("장소 목록 조회 Controller");
		int currPage = Integer.parseInt(page);
		int start = (currPage-1) * 10;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<SpaceDTO> list= service.getSpaceList(start);
		int spaceCnt = service.countSpace();
		
//		logger.info("list size: "+list.size());
//		logger.info("list : "+list);
		logger.info("입력 페이지: "+start);
//		logger.info("currPage: "+currPage);
		logger.info("spaceCnt: "+spaceCnt);

		result.put("spaceList", list);
		result.put("currPage", currPage);
		result.put("spaceCnt", spaceCnt);
		
		return result;
	}

	
	// 질문 작성 요청 처리
	@RequestMapping(value="/space/writeQnaForm.do", method = RequestMethod.POST)
	public String writeQnaFormdo(int space_no, String question_content, Model model, HttpSession session) {
		logger.info("장소 질문 작성 요청 처리");
		// 로그인하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/login.go";
		} 
		// 세션에 저장된 로그인 아이드를 가져온다
		String user_id = (String) session.getAttribute("loginInfo");
		
		// 작성한 질문을 DB에 저장한다
		service.insertQuestion(space_no, user_id, question_content);
		return "redirect:/space/detail.go?space_no=" + space_no;
	}
	
	// 예약 요청 처리
	@RequestMapping(value="/space/reservation.go", method = RequestMethod.POST)
	public String reservationdo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("장소 예약 확인 페이지로 이동");
		// 로그인하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/login.go";
		} 
		logger.info("params : {}", params);
		// 예약 시작, 종료 시간을 각 변수에 저장한다
		Timestamp group_starttime = java.sql.Timestamp.valueOf(params.get("starttime"));
		Timestamp group_endtime = java.sql.Timestamp.valueOf(params.get("endtime"));
		
		String user_id = (String) session.getAttribute("loginInfo");
		
		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setSpace_no(Integer.parseInt(params.get("space_no")));
		groupDTO.setUser_id(user_id);
		groupDTO.setGroup_name("개인 예약");
		groupDTO.setGroup_state("5"); // 예약 상태는 예약 중으로 설정한다
		groupDTO.setGroup_create_date(new Date(System.currentTimeMillis()));
		groupDTO.setGroup_people(Integer.parseInt(params.get("group_people"))); // 모임 등록시 인원 수를 1명으로 지정한다 
		groupDTO.setGroup_introduce("개인 예약"); 
		groupDTO.setGroup_caution("개인 예약");
		groupDTO.setGroup_confirm(new Timestamp(group_starttime.getTime() - (3 * 24 * 60 * 60 * 1000))); // 예약 확정 날짜는 모임 날짜 3일전이므로 그만큼 빼준다
		groupDTO.setGroup_starttime(group_starttime);
		groupDTO.setGroup_endtime(group_endtime);
		groupDTO.setGroup_lowpeople(1);
		groupDTO.setGroup_highpeople(1);
		
		SpaceDTO spaceDTO = service.getSpaceInfo(Integer.parseInt(params.get("space_no")));
		
		// 예약 정보들을 groupDTO 로 뿌려준다
		model.addAttribute("groupDTO", groupDTO);
		model.addAttribute("spaceDTO", spaceDTO);
		SimpleDateFormat hour = new SimpleDateFormat("HH");
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat day = new SimpleDateFormat("dd");
		model.addAttribute("year", year.format(groupDTO.getGroup_starttime()));
		model.addAttribute("month", month.format(groupDTO.getGroup_starttime()));
		model.addAttribute("day", day.format(groupDTO.getGroup_starttime()));
		model.addAttribute("starttime", hour.format(group_starttime));
		model.addAttribute("endtime", hour.format(group_endtime));
		
		// 세션에 모임(예약) 정보를 담아둔다
		session.setAttribute("groupDTO", groupDTO);
		return "/space/spacePayment";
	}

	// 장소 예약 결제 처리
	@RequestMapping(value="/space/payment.do")
	public String paymentDo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("장소 예약 처리 요청");
		// 비회원은 로그인 페이지로 이동
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/login.go";
		// 세션에서 예약 정보가 담겨 있는지 확인한다
		} else if (session.getAttribute("groupDTO") != null) {
			GroupDTO groupDTO = (GroupDTO) session.getAttribute("groupDTO");
			session.removeAttribute("groupDTO");
			// 데이터베이스에 모임 정보를 등록한다
			if (service.payment(groupDTO, model)) {
				logger.info("장소 예약 결제 성공");
				return "/group/groupPaymentSuccess";
			}
		}
		return "/group/groupPaymentFail";
	}
	
	// 리뷰 페이징 요청 처리
	@RequestMapping(value="/space/reviewPagination.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewPaginationAjax(int space_no, int page, String sort) {
		logger.info("페이징 처리된 리뷰 목록 데이터 반환");
		Map<String, Object> response =  new HashMap<String, Object>();
		// 페이징 처리된 리뷰 목록(장소 번호, 페이지 번호, 정렬 순서)
		List<SpaceReviewDTO> reviewList = service.getSpaceReview(space_no, page, sort);
		
		// 페이징 처리를 위해 총 페이지수 계산해 저장한다
		int totalPages = (int) Math.ceil( (float) reviewList.size() / 5);
		
		// 페이지한테 페이징 처리된 목록과 총 페이지 수를 보내준다
		response.put("reviewList", reviewList);
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
		List<SpaceQuestionDTO> questionList = service.getSpaceQna(space_no, page, sort);
		logger.info("questionList : {}", questionList);
		// 페이징 처리를 위해 총 페이지수 계산해 저장한다 
		int totalPages = (int) Math.ceil( (float) questionList.size() / 5);
		
		// 페이지한테 페이징 처리된 목록과 총 페이지 수를 보내준다
		response.put("questionList", questionList); 
		// 질문의 답변은 questionList 안에 spaceAnswerDTO 로 접근할 수 있다
		response.put("totalPages", totalPages);
		return response;
	}
	
	// 해당 날짜 예약 가능한 시간 반환
	@RequestMapping(value="/space/checkReservationTimes.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkReservationTimesAjax(int space_no, String choice_date) {
		logger.info("해당 날짜 예약 가능한 시간 반환");
		Map<String, Object> response =  new HashMap<String, Object>();
		List<Integer> reservationTimes = service.getReservationTimes(space_no, choice_date);
		logger.info("reservationTimes : {}", reservationTimes);
		response.put("reservationTimes", reservationTimes);
		return response;
	}
	
	
	// 장소 수정페이지 이동
	@RequestMapping(value="/space/update.go", method = RequestMethod.GET)
	public String editGo(Integer space_no, Model model, HttpSession session) {
		logger.info("장소 수정 페이지 이동");
		
		SpaceDTO spaceupdate = service.getSpaceById(space_no);
		model.addAttribute("space", spaceupdate);
		model.addAttribute("space_no", space_no);
		return "space/spaceUpdateForm";
	}
	
	// 장소 수정처리
	
	@RequestMapping(value="/space/update.do", method = RequestMethod.POST)
	public String updateSpace(@RequestParam Map<String, String> params,
	                          @RequestParam(value="mainPhoto", required=false) MultipartFile mainPhoto,
	                          @RequestParam(value="photos", required=false) MultipartFile[] photos,
	                          Model model) {
	    logger.info("장소 수정 처리");
	    logger.info("params : {}", params);
	    // space_no 파라미터가 null이 아닌 경우에만 정수로 변환하여 사용
	    Integer space_no = null;
	    try {
	        if (params.get("space_no") != null && !params.get("space_no").isEmpty()) {
	            space_no = Integer.parseInt(params.get("space_no"));
	            model.addAttribute("space_no",space_no);
	            logger.info("space_no : {}",space_no);
	        } else {
	            logger.info("실패");
	            
	        }
	    } catch (NumberFormatException e) {
	        // space_no가 숫자로 변환할 수 없는 경우에 대한 예외 처리
	        logger.error("space_no 파라미터를 정수로 변환하는 중 오류가 발생하였습니다.", e);
	        
	    }

	    // 수정된 내용을 데이터베이스에 업데이트하는 로직을 추가합니다.
	    int result = service.updateSpace(params, mainPhoto, photos);
	    
	    // 수정이 완료된 후 상세 페이지로 이동합니다.
	    if (result > 0) {
	    	
	        return "redirect:/space/detail.go";
	    } else {
	        // 실패한 경우에 대한 처리를 여기에 추가합니다.
	        return "redirect:/error"; // 예를 들어, 에러 페이지로 이동하도록 처리할 수 있습니다.
	    }
	}

}
