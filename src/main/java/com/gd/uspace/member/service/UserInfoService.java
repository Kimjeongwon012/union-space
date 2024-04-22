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

	
}
