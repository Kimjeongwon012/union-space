package com.gd.uspace.member.dao;

import com.gd.uspace.member.dto.UserInfoDTO;

public interface UserinfoDAO {

	UserInfoDTO getUserInfo(String user_Id);

	void updateUserInfo(UserInfoDTO userInfoDTO);

	
}
