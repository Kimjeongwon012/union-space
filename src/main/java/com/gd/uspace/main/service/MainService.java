package com.gd.uspace.main.service;

import java.sql.Date;
import java.util.List;

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

	public List<PointDTO> pageGet(int page, String sort, String state) {
		PointPageDTO ppageDTO = new PointPageDTO();
		ppageDTO.setPage((page-1)*10);
		ppageDTO.setSort(sort);
		ppageDTO.setState(state);
		List<PointDTO> result = mainDAO.pageGet(ppageDTO);
		return result;
	}
	
}
