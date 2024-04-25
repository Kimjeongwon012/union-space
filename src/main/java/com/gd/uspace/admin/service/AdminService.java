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

@Service
public class AdminService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDAO adminDAO;
	// 관리자페이지 QnA관리 목록조회
	public List<AdminDTO> adminQna_list() {
		return adminDAO.adminQna_list();
	}
	// 관리자페이지 QnA 관리 필터링 조회
	public List<AdminDTO> selectAdminQna(Map<String, String> params) {
		logger.info("Qna select params :",params);
		return adminDAO.selectAdminQna(params);
	}
	// 관리자페이지 메인 예약내역 조회
	public List<AdminDTO> adminMain_list() {
		return adminDAO.adminMain_list();
	}
	// 관리자페이지 메인 예약내역 필터링 조회
	public List<AdminDTO> selectAdminMain(Map<String, String> params) {
		logger.info("pareams : {}", params);
		return adminDAO.selectAdminMain(params);
	}
	// 관리자페이지 장소별 리뷰 내역 조회
	public List<AdminDTO> adminSpaceReview_list() {
		return adminDAO.adminSpaceReview_list();
	}
	// 관리자페이지 장소별 리뷰 필터링 조회
	public List<AdminDTO> adminSpaceReviewSerch(Map<String, String> params) {
		logger.info("pareams : {}", params);
		return adminDAO.adminSpaceReviewSerch(params);
	}



	
	
}
