package com.gd.uspace.main.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.main.dto.MainDTO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

@Service
public class MainService {

	@Autowired MainDAO mainDAO;
	
	public MemberDTO getMemberDTO(String user_id) {
		return mainDAO.getMemberDTO(user_id);
	}

	public List<GroupDTO> mypage_list() {
		return mainDAO.mypage_list();
	}

	public void getResultList(Map<String, Object> params, Map<String, Object> response) {
		
	}

	public int getPointBalance(String userId) {
		return mainDAO.getPointBalance(userId);
	}

	public int getMannerScore(String userId) {
		return mainDAO.getMannerScore(userId);
	}

	public double getAttendanceRate(String userId) {
		return mainDAO.getAttendanceRate(userId);
	}
	
}
