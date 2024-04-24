package com.gd.uspace.member.dao;

import com.gd.uspace.member.dto.UserInfoDTO;

public interface UserinfoDAO {

	UserInfoDTO getUserInfo(String user_Id);

	void updateUserInfo(UserInfoDTO userInfoDTO);

	int changePassword(String user_id, String newPassword);

	String getPassword(String user_id);

	int withdraw(String userId);

	

	
}
