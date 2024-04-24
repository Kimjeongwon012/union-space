package com.gd.uspace.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.member.dao.UserinfoDAO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.UserInfoDTO;

@Service
public class UserInfoService {
    
    @Autowired 
    UserinfoDAO userinfodao;
    
    Logger logger = LoggerFactory.getLogger(getClass());

    // 사용자 정보를 조회하는 메서드
    public UserInfoDTO getUserInfo(String user_id) {
        UserInfoDTO userInfo = userinfodao.getUserInfo(user_id);
        logger.info("userInfo : {}", userInfo);
        if(userInfo == null) {
            logger.error("사용자 정보를 가져오는 데 실패했습니다.");
            // 사용자 정보가 없을 경우에 대한 처리
            // 예외처리 또는 기본값 반환 등
        }
        return userInfo;
    }

    public void updateUserInfo(UserInfoDTO userInfoDTO) {
    	logger.info("회원정보 수정");
        userinfodao.updateUserInfo(userInfoDTO);
    }

    public boolean changePassword(String user_id, String newPassword) {
        logger.info(newPassword);
        logger.info("{}", userinfodao.changePassword(user_id, newPassword));
        return userinfodao.changePassword(user_id, newPassword) == 1 ? true : false;
    }

	public String getPassword(String user_id) {
		logger.info("현재 비밀번호 확인");
		
		
		return userinfodao.getPassword(user_id);
	}

	public boolean isValidPassword(String userId, String password) {
	    // 사용자의 입력된 비밀번호와 실제 저장된 비밀번호를 비교하여 일치 여부를 확인합니다.
	    String storedPassword = userinfodao.getPassword(userId);
	    return storedPassword != null && storedPassword.equals(password);
	}

	public boolean withdraw(String userId, String password) {
	    // 입력된 비밀번호가 맞는지 확인합니다.
	    if (isValidPassword(userId, password)) {
	        // 비밀번호가 맞다면 회원을 탈퇴합니다.
	        return userinfodao.withdraw(userId) == 1;
	    } else {
	        // 비밀번호가 일치하지 않는 경우 처리
	        return false;
	    }
	}
}
