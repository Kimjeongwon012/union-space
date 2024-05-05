package com.gd.uspace.point.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dao.PointDAO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

@Service
public class PointService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PointDAO pointDAO;
	
	public List<MemberDTO> lastpoint() {
		return pointDAO.lastpoint();
	}
	
	
	public List<PointDTO> PointGet(String userId, int page, String state, String sort) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*10);
		ppageDTO.setSort(sort);
		ppageDTO.setState(state);
		ppageDTO.setUserId(userId);
		List<PointDTO> result = pointDAO.PointGet(ppageDTO);
		return result;
	}
	
	public int PointGetAllCount(String userId, int page, String state, String sort) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*10);
		ppageDTO.setSort(sort);
		ppageDTO.setState(state);
		ppageDTO.setUserId(userId);
		return pointDAO.PointGetAllCount(ppageDTO);
	}
	
	
	public int charge(int point_price) {
		// 'bb' 의 현재 잔액 
		int user_point = pointDAO.getUserPoint();
		//param1 : point_price, param2 : point_price+user_point
		return pointDAO.charge(point_price, (point_price + user_point));
	}
	/*
	public List<MemberDTO> lastpoint(String loginInfo) {
		return pointDAO.lastpoint(loginInfo);
	}
	*/
	
	
	/*
	public void updatePoint(String user_id, int point_price) {
		pointDAO.updatePoint(user_id,point_price);
	}
	*/
	public void updatePoint(int point_price, String userId) {
		int row = pointDAO.updatePoint(point_price, userId);
	}

	

	
	/*
	public List<PointDTO> UserPointList() {
		return pointDAO.UserPointList();
	}
	*/
	public List<PointDTO> UserPointList(int page, String sort, String state, String userId) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*10);
		ppageDTO.setSort(sort);
		ppageDTO.setState(state);
		ppageDTO.setUserId(userId);
		List<PointDTO> result = pointDAO.UserPointList(ppageDTO);
		return result;
	}

	public int UserPointListAllCount(int page, String sort, String state, String userId) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*10);
		ppageDTO.setSort(sort);
		ppageDTO.setState(state);
		ppageDTO.setUserId(userId);
		return pointDAO.UserPointListAllCount(ppageDTO);
	}


}
