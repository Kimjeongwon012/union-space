package com.gd.uspace.reservation.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointPageDTO;
import com.gd.uspace.reservation.dao.ReservationDAO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Service
public class ReservationService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReservationDAO resDAO;

	public List<GroupDTO> GetGoupList() {
		return resDAO.GetGoupList();
	}

	public List<GroupDTO> GetGoupList(int page) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		List<GroupDTO> result = resDAO.GetGoupList(ppageDTO);
		return result;
	}

	public int GroupAllCount() {
		return resDAO.GroupAllCount();
	}

	public List<GroupDTO> GetList(int page) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		List<GroupDTO> result = resDAO.GetList(ppageDTO);
		return result;
	}

	public int ResAllCount() {
		return resDAO.ResAllCount();
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

	
}
