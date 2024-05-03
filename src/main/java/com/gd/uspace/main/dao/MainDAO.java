package com.gd.uspace.main.dao;

import java.util.List;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dto.MainDTO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

public interface MainDAO {

	MemberDTO getMemberDTO(String user_id);

	List<GroupDTO> mypage_list();

	List<PointDTO> pageGet(PointPageDTO ppageDTO);

	
}
