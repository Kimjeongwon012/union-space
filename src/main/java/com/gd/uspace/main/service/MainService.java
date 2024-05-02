package com.gd.uspace.main.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.main.dto.SpaceInfoDTO;
import com.gd.uspace.member.dto.MemberDTO;

@Service
public class MainService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainDAO dao;
	
	public MemberDTO getMemberDTO(String user_id) {
		return dao.getMemberDTO(user_id);
	}

	public void getResultList(Map<String, Object> params, Map<String, Object> response) {
		int spaceTotalPages = dao.getSpaceListTotalPages(params);
		logger.info("spaceTotalPages : {}", spaceTotalPages);
		int groupTotalPages = dao.getGroupListTotalPages(params);
		logger.info("groupTotalPages : {}", groupTotalPages);
		int page = Integer.parseInt((String) params.get("page"));
		logger.info("page : {}", page);
		params.put("people", Integer.parseInt((String) params.get("people")));

		List<SpaceInfoDTO> spaceList = new ArrayList<SpaceInfoDTO>();
		if (spaceTotalPages >= page) {
			params.put("page", (page - 1) * 10);
			
			spaceList = dao.getSpaceList(params);
		}
		List<GroupDTO> groupList = new ArrayList<GroupDTO>();
		if (groupTotalPages >= page) {
			params.put("page", (page - 1) * 8);
			groupList = dao.getGroupList(params);
		}
		logger.info("params : {}", params);
		
		response.put("spaceList", spaceList);
		response.put("groupList", groupList);
		response.put("totalPages", Math.max(spaceTotalPages, groupTotalPages));
	}
	/*
	int temp = Integer.parseInt((String) params.get("page"));
	int page = (temp - 1) * 10;
	logger.info("page : {}", page);
	params.put("page", page);
	params.put("people", Integer.parseInt((String) params.get("people")));
	List<SpaceInfoDTO> spaceList = dao.getSpaceList(params);
	page = (temp - 1) * 8;
	params.put("page", page);
	logger.info("params : {}", params);
	List<GroupDTO> groupList = dao.getGroupList(params);
	// List<GroupDTO> groupList = new ArrayList<GroupDTO>();
	logger.info("spaceList : {} ", spaceList.get(0));
	for (SpaceInfoDTO s : spaceList) {
		logger.info("SpaceInfoDTO : {}", s.toString());
	}
	for (GroupDTO g : groupList) {
		logger.info("GroupDTO : {}", g.toString());
	}
	int spaceTotalPages = dao.getSpaceListTotalPages(params);
	logger.info("spaceTotalPages : {}", spaceTotalPages);
	int groupTotalPages = dao.getGroupListTotalPages(params);
	logger.info("groupTotalPages : {}", spaceTotalPages);
	response.put("spaceList", spaceList);
	response.put("groupList", groupList);
	response.put("spaceTotalPages", spaceTotalPages);
	response.put("groupTotalPages", groupTotalPages);
	*/
}
