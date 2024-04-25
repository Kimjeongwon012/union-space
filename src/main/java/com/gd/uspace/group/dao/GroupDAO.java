package com.gd.uspace.group.dao;

import java.sql.Date;
import java.util.List;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.space.dto.SpaceDTO;

public interface GroupDAO {

	SpaceDTO getSpaceInfo(String space_no);

	int getUserBalance(String user_id);

	int getPaymentAmount(int space_no);

	int registerGroup(GroupDTO groupDTO);

	List<GroupDTO> checkGroupConfirm();

	int setUserBalance(String user_id, int payment_amount);

	void insertPointList(PointDTO pointDTO);

	void insertGroupMember(GroupMemberDTO groupMemberDTO);

	List<GroupDTO> checkGroupAfterConfirm();

	void setGroupState(int group_no, int i);

	List<GroupMemberDTO> getGroupMembers();

	int getSpacePoint(int space_no);

}
