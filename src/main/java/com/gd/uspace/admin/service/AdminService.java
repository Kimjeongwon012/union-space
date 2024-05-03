package com.gd.uspace.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.admin.dao.AdminDAO;
import com.gd.uspace.admin.dto.AdminDTO;
import com.gd.uspace.space.dto.SpaceAnswerDTO;

@Service
public class AdminService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDAO adminDAO;
	// 관리자페이지 QnA관리 목록조회
	public List<AdminDTO> adminQna_list() {
		return adminDAO.adminQna_list();
	}
	// 관리자페이지 QnA 관리 필터링 조회
	public List<AdminDTO> selectAdminQna(Map<String, String> params, int start, int pageSize) {

	    params.put("start", String.valueOf(start));
	    params.put("pageSize", String.valueOf(pageSize));
		logger.info("Qna select params : {}",params);
		return adminDAO.selectAdminQna(params);
	}
	// 관리자페이지 메인 예약내역 조회
	public List<AdminDTO> adminMain_list() {
		return adminDAO.adminMain_list();
	}
	// 관리자페이지 메인 예약내역 필터링 조회
	public List<AdminDTO> selectAdminMain(Map<String, String> params, int start, int pageSize) {
		logger.info("pareams : {}", params);
	    params.put("start", String.valueOf(start));
	    params.put("pageSize", String.valueOf(pageSize));
		return adminDAO.selectAdminMain(params);
	}
	// 관리자페이지 장소별 리뷰 내역 조회
	public List<AdminDTO> adminSpaceReview_list() {
		return adminDAO.adminSpaceReview_list();
	}
	// 관리자페이지 장소별 리뷰 필터링 조회
	public List<AdminDTO> adminSpaceReviewSerch(Map<String, String> params, int start, int pageSize) {
	    logger.info("파라메타 어떤 거받아오냐 새키야 params : {}", params);
	    params.put("start", String.valueOf(start));
	    params.put("pageSize", String.valueOf(pageSize));
	    logger.info("start : {}, pageSize : {}", start, pageSize);
	    return adminDAO.adminSpaceReviewSerch(params);
	}
	public boolean saveAnswer(String answer, String questionNo) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("answer", answer);
	    paramMap.put("questionNo", questionNo);
	    boolean success = adminDAO.saveAnswer(paramMap) == 1 ? true : false;
	    return success;
	}
	public AdminDTO getAnswer(String questionNo) {
		AdminDTO admindto = adminDAO.getAnswer(questionNo);
		return admindto;
	}






	
	
}
