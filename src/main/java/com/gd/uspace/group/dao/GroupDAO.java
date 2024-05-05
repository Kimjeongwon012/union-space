package com.gd.uspace.group.dao;

import java.sql.Date;
import java.util.List;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.group.dto.PenaltyDTO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.space.dto.SpaceDTO;

public interface GroupDAO {

	SpaceDTO getSpaceInfo(int space_no);

	int getUserBalance(String user_id);

	int getPaymentAmount(int space_no);

	int registerGroup(GroupDTO groupDTO);

	List<GroupDTO> checkGroupConfirm();

	void addUserBalance(String user_id, int payment_amount);

	void insertPointList(PointDTO pointDTO);

	void insertGroupMember(GroupMemberDTO groupMemberDTO);

	List<GroupDTO> checkGroupAfterConfirm();

	void setGroupState(int group_no, int i);

	int getSpacePoint(int space_no);

	GroupDTO getGroupInfo(int group_no);

	List<MemberDTO> getGroupMemberList(int group_no);

	MemberDTO getGroupRegistrant(int group_no);

	SpaceDTO getGroupSpaceInfo(int group_no);

	void setGroupPeople(int group_no, int group_people);

	void removeGroupMember(int group_no, String user_id);

	int isBeforeConfirm(int group_no);

	void addWarningCount(String user_id, int i);

	int getUserWarningCount(String user_id);

	List<PenaltyDTO> getUsersWarningCount();

	void setUserStatus(String user_id, int i);

	List<GroupMemberDTO> getGroupMembers(int group_no);

	GroupDTO getGroupByNo(int group_no);

	void updateGroup(GroupDTO groupDTO);

	List<GroupDTO> checkGroupBeforeConfirm();

	String getSpaceMainPhoto(int space_no);

	List<GroupDTO> checkGroupAfterEndTime();


}
