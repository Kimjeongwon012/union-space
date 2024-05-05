package com.gd.uspace.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.main.dto.MainDTO;
import com.gd.uspace.main.dto.SpaceInfoDTO;
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
        int spaceTotalPages = mainDAO.getSpaceListTotalPages(params);
        logger.info("spaceTotalPages : {}", spaceTotalPages);
        int groupTotalPages = mainDAO.getGroupListTotalPages(params);
        logger.info("groupTotalPages : {}", groupTotalPages);
        int page = Integer.parseInt((String) params.get("page"));
        logger.info("page : {}", page);
        params.put("people", Integer.parseInt((String) params.get("people")));

        List<SpaceInfoDTO> spaceList = new ArrayList<SpaceInfoDTO>();
        if (spaceTotalPages >= page) {
            params.put("page", (page - 1) * 10);
            
            spaceList = mainDAO.getSpaceList(params);
        }
        List<GroupDTO> temp = new ArrayList<GroupDTO>();
        List<Map<String,Object>> groupList = new ArrayList<Map<String,Object>>();
        if (groupTotalPages >= page) {
            params.put("page", (page - 1) * 8);
            temp = mainDAO.getGroupList(params);
            SimpleDateFormat date = new SimpleDateFormat("yy년 M월 d일");

            for (GroupDTO g : temp) {
                Map<String,Object> group = new HashMap<String, Object>();
                long timestamp = g.getGroup_confirm().getTime(); // 타임스탬프 가져오기
                java.util.Date confirmDate = new java.util.Date(timestamp);
                Date nowDate = new Date(System.currentTimeMillis());
                long diffDays = (confirmDate.getTime() - nowDate.getTime()) / (24 * 60 * 60 * 1000); // 일 차이
                group.put("name", g.getGroup_name());
                group.put("group_no", g.getGroup_no());
                group.put("confirmDate", date.format(g.getGroup_confirm()));
                group.put("startDate", date.format(g.getGroup_starttime()));
                group.put("dDay", String.valueOf(diffDays));
                group.put("state", g.getGroup_state());
                group.put("currentNumberOfMember", String.valueOf(g.getGroup_people()));
                group.put("maxNumberOfMember", String.valueOf(g.getGroup_highpeople()));
                groupList.add(group);
            }
        }
        logger.info("params : {}", params);
        
        response.put("spaceList", spaceList);
        response.put("groupList", groupList);
        response.put("totalPages", Math.max(spaceTotalPages, groupTotalPages));
	}

	public int getPointBalance(String userId) {
	    Integer pointBalance = mainDAO.getPointBalance(userId);
	    //System.out.println(pointBalance);
	    return pointBalance != null ? pointBalance : 0;
	}

	public int getMannerScore(String userId) {
	    Integer mannerScore = mainDAO.getMannerScore(userId);
	    //System.out.println(mannerScore);
	    return mannerScore != null ? mannerScore : 0;
	}

	public double getAttendanceRate(String userId) {
	    Double attendanceRate = mainDAO.getAttendanceRate(userId);
	    //System.out.println(attendanceRate);
	    return attendanceRate != null ? attendanceRate : 0.0;
	}

	public void addAttenDance(int group_no, String user_id, Map<String, Object> response) {
		// 출석 내역 기록
		mainDAO.addAttenDance(group_no, user_id);
	}
	
}
