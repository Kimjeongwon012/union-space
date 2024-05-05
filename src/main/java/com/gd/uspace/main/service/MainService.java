package com.gd.uspace.main.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public MemberDTO getMemberDTO(String user_id) {
		return mainDAO.getMemberDTO(user_id);
	}

	public List<GroupDTO> mypage_list(String userId) {
		return mainDAO.mypage_list(userId);
	}

	public void getResultList(Map<String, Object> params, Map<String, Object> response) {
		
	}

	public int getPointBalance(String userId) {
	    Integer pointBalance = mainDAO.getPointBalance(userId);
	    System.out.println(pointBalance);
	    return pointBalance != null ? pointBalance : 0;
	}

	public int getMannerScore(String userId) {
	    Integer mannerScore = mainDAO.getMannerScore(userId);
	    System.out.println(mannerScore);
	    return mannerScore != null ? mannerScore : 0;
	}

	public double getAttendanceRate(String userId) {
	    Double attendanceRate = mainDAO.getAttendanceRate(userId);
	    System.out.println(attendanceRate);
	    return attendanceRate != null ? attendanceRate : 0.0;
	}
	
}
