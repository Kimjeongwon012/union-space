package com.gd.uspace.group.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dao.GroupDAO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Service
public class GroupService {

	@Autowired GroupDAO groupdao;
	
	public SpaceDTO getSpaceInfo(String space_no) {
		SpaceDTO spaceDTO = groupdao.getSpaceInfo(space_no);
		return spaceDTO;
	}

	public void registerGroup(Map<String, String> params) {
		
	}
	
}
