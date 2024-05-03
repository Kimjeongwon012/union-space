package com.gd.uspace.main.dao;

import java.util.List;
import java.util.Map;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.main.dto.SpaceInfoDTO;
import com.gd.uspace.member.dto.MemberDTO;

public interface MainDAO {

	MemberDTO getMemberDTO(String user_id);

	List<SpaceInfoDTO> getSpaceList(Map<String, Object> params);

	List<GroupDTO> getGroupList(Map<String, Object> params);

	int getSpaceListTotalPages(Map<String, Object> params);

	int getGroupListTotalPages(Map<String, Object> params);


}
