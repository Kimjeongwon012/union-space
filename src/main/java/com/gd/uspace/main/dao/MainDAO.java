package com.gd.uspace.main.dao;

import java.util.List;
<<<<<<< HEAD

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dto.MainDTO;
=======
import java.util.Map;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dto.SpaceInfoDTO;
>>>>>>> origin/master
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

public interface MainDAO {

	MemberDTO getMemberDTO(String user_id);

<<<<<<< HEAD
	List<GroupDTO> mypage_list();

	List<PointDTO> pageGet(PointPageDTO ppageDTO);

	
=======
	List<SpaceInfoDTO> getSpaceList(Map<String, Object> params);

	List<GroupDTO> getGroupList(Map<String, Object> params);

	int getSpaceListTotalPages(Map<String, Object> params);

	int getGroupListTotalPages(Map<String, Object> params);


>>>>>>> origin/master
}
