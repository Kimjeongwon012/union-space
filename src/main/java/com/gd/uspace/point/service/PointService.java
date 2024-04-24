package com.gd.uspace.point.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dao.PointDAO;
import com.gd.uspace.point.dto.PointDTO;

@Service
public class PointService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PointDAO pointDAO;
	
	public int charge(PointDTO chargeDTO) {
		
		return pointDAO.charge(chargeDTO);
	}

	public List<PointDTO> list() {
		logger.info("{}",pointDAO.list());
		return pointDAO.list();
	}

	public List<MemberDTO> lastpoint() {
		return pointDAO.lastpoint();
	}

	public int currpoint(String user_id) {
		int row = pointDAO.currpoint(user_id);
		return row;
	}
	/*
	public void updatePoint(String user_id, int point_price) {
		pointDAO.updatePoint(user_id,point_price);
	}
	*/
	public void updatePoint(int point_price) {
		int row = pointDAO.updatePoint(point_price);
	}

}
