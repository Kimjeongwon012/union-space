package com.gd.uspace.reservation.service;

import java.sql.Date;
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

	public List<GroupDTO> GetGoupList(int page, Date startdate, Date enddate) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		ppageDTO.setStartdate(startdate);
		ppageDTO.setEnddate(enddate);
		List<GroupDTO> result = resDAO.GetGoupList(ppageDTO);
		return result;
	}

	public int GroupAllCount(Date startdate, Date enddate) {
		return resDAO.GroupAllCount(startdate, enddate);
	}

	public List<GroupDTO> GetList(String user_id, int page, Date startdate, Date enddate) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*3);
		ppageDTO.setStartdate(startdate);
		ppageDTO.setEnddate(enddate);
		ppageDTO.setUser_id(user_id);
		List<GroupDTO> result = resDAO.GetList(ppageDTO);
		return result;
	}

	public int ResAllCount(Date startdate, Date enddate) {
		return resDAO.ResAllCount(startdate, enddate);
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
