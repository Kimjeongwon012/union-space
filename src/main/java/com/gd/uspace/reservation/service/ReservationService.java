package com.gd.uspace.reservation.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;import org.aspectj.lang.reflect.InterTypeMethodDeclaration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointPageDTO;
import com.gd.uspace.reservation.dao.ReservationDAO;
import com.gd.uspace.reservation.dto.EvaluateDTO;
import com.gd.uspace.reservation.dto.EvaluateItemDTO;
import com.gd.uspace.reservation.dto.EvaluateListDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Service
public class ReservationService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReservationDAO resDAO;

	public List<GroupDTO> GetGoupList(String user_id, int page, String sort) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		ppageDTO.setSort(sort);
		ppageDTO.setUser_id(user_id);
		List<GroupDTO> result = resDAO.GetGoupList(ppageDTO);
		return result;
	}

	public int GroupAllCount(String user_id) {
		return resDAO.GroupAllCount(user_id);
	}

	public List<GroupDTO> GetList(String user_id, int page, String sort) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		ppageDTO.setSort(sort);
		ppageDTO.setUser_id(user_id);
		List<GroupDTO> result = resDAO.GetList(ppageDTO);
		return result;
	}

	public int ResAllCount(String user_id) {
		return resDAO.ResAllCount(user_id);
	}
	
	public int writeReview(SpaceReviewDTO srDTO) {
		int space_no = resDAO.selectSpaceNo(srDTO);
		return resDAO.writeReview(srDTO);
	}

	public int writeReview(Map<String, String> params) {
		int space_no = resDAO.selectSpaceNo(params);
		logger.info("space_no : {}", space_no);
		params.put("space_no", String.valueOf(space_no));
		resDAO.writeReview(params);
		return space_no;
	}

	public List<EvaluateListDTO> getEvaluateList(String group_no, String user_id) {
		List<EvaluateListDTO> evaluateList = resDAO.getEvaluateList(group_no, user_id);
		return evaluateList;
	}

	public Map<Integer, String> getEvaluateItemList() {
		List<EvaluateItemDTO> temp = resDAO.getEvaluateItemList();
		Map<Integer, String> items = new HashMap<Integer, String>();
		for (EvaluateItemDTO i : temp) {
			//logger.info("EvaluateItemDTO : {}", i.toString());
			items.put(i.getItem_no(), i.getItem_content());
		}
		return items;
	}

	public void insertEvaluate(Map<String, String> params, int[] evaluationList) {
		// 평가 항목의 점수들을 불러온다 
		List<EvaluateItemDTO> temp = resDAO.getEvaluateItemList();
		Map<Integer, Double> itemOfSocreList = new HashMap<Integer, Double>();
		for (EvaluateItemDTO item : temp) {
			logger.info("item : {}", item.toString());
			itemOfSocreList.put(item.getItem_no(), item.getItem_score());
		}
		// 평가한 총합 점수 계산
		double totalScore = 0;
		for (int itemNo : evaluationList) {
			totalScore += itemOfSocreList.get(itemNo);
		}
		logger.info("totalScore : {}", totalScore);
		EvaluateDTO evaluateDTO = new EvaluateDTO();
		evaluateDTO.setGroup_no(Integer.parseInt(params.get("group_no")));
		evaluateDTO.setUser_id(params.get("user_id"));
		evaluateDTO.setUser_evid(params.get("user_evid"));
		evaluateDTO.setUser_review_total_manner_score(totalScore);
		logger.info("evaluateDTO : {}", evaluateDTO.toString());
		// 평가자, 평가 대상자, 평가 총합 점수 userReview 에 기록
		resDAO.addEvaluate(evaluateDTO);
		// 평가 대상자의 매너점수에 반영한다
		resDAO.updateMannerScore(params.get("user_evid"), totalScore);
		int attendance_no = evaluateDTO.getAttendance_no();
		for (int user_review_no : evaluationList) {
			// 평가 번호, 평가 항목 번호 기록 userReviewDetail 에 기록
			resDAO.addEvaluateDetail(attendance_no, user_review_no);		
		}		

	}

	
}

