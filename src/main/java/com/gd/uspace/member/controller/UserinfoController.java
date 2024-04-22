package com.gd.uspace.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.UserInfoDTO;
import com.gd.uspace.member.service.UserInfoService;

@Controller
public class UserinfoController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserInfoService userinfoservice;
	
	@RequestMapping(value="/userinfo", method = RequestMethod.GET)
	public String userinfo(HttpSession session, Model model) {
	    logger.info("회원 정보 조회 페이지");	

	    String userId = (String) session.getAttribute("loginInfo");
	    logger.info("userId : {}", userId);
	    
	    // 세션에서 사용자 아이디를 가져오지 못하는 경우 처리
	    if (userId == null) {
	        logger.error("로그인되어 있지 않습니다. 로그인 페이지로 이동합니다.");
	        return "redirect:/login.go"; // 로그인 페이지로 리다이렉트
	    }

	    // 세션에서 실제 사용자 아이디를 가져와서 사용자 정보 조회
	    UserInfoDTO userInfo = userinfoservice.getUserInfo(userId);

	    // 사용자 정보가 없는 경우 처리
	    if (userInfo == null) {
	        logger.error("사용자 정보를 가져오는 데 실패했습니다.");
	        // 오류 처리 로직 추가 또는 메시지 전달
	        model.addAttribute("error", "사용자 정보를 가져오는 데 실패했습니다.");
	        return "errorPage"; // 오류 페이지로 이동
	    }

	    // 모델에 사용자 정보 추가
	    model.addAttribute("user_id", userInfo.getUser_id());
	    model.addAttribute("user_pw", userInfo.getUser_pw());
	    model.addAttribute("user_name", userInfo.getUser_name());
	    model.addAttribute("user_phone", userInfo.getUser_phone());
	    model.addAttribute("user_gender", userInfo.getUser_gender());
	    model.addAttribute("user_email", userInfo.getUser_email());
	    
	    

	    return "mypage/getuserinfo";
	}
	
	@RequestMapping(value="/userEdit", method = RequestMethod.GET)
	public String userEdit() {
	    logger.info("회원 정보 수정 페이지로 이동");
	    return "mypage/userEdit"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	// 회원 정보 수정 완료
	/* @ModelAttribute UserInfoDTO userInfoDTO */
    @RequestMapping(value="/updateUserInfo", method = RequestMethod.POST)
    public String updateUserInfo(@RequestParam Map<String,String> params) {
        logger.info("회원 정보 수정 요청");
        // 여기서 userInfo 객체를 사용하여 사용자 정보를 업데이트하는 로직을 구현합니다.
        // 성공적으로 업데이트되면 어떤 페이지로 이동할지를 반환합니다.
        logger.info("{}", params.get("name"));
        logger.info("{}", params);
        UserInfoDTO userInfoDTO = new UserInfoDTO();
        userInfoDTO.setUser_name(params.get("name"));
        userInfoDTO.setUser_phone(params.get("phone"));
        userInfoDTO.setUser_email(params.get("email"));
        userInfoDTO.setUser_id(params.get("id"));
        userinfoservice.updateUserInfo(userInfoDTO);
        
        return "redirect:/userinfo"; // 예시로 회원 정보 조회 페이지로 리다이렉트
    }
	
	@RequestMapping(value="/pwChange", method = RequestMethod.GET)
	public String pwChangego() {
	    logger.info("회원 정보 수정 페이지로 이동");
	    return "mypage/pwChange"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	@RequestMapping(value="/pwChange.do", method = RequestMethod.POST)
	public String pwChangedo(@RequestParam Map<String,String> params) {
	    logger.info("비밀번호 변경 요청");
	    logger.info("{}", params);
	    // 입력한 비밀번호와 비교해서 맞는지 확인
	    // 불일치하면 모달 닫기
	    // 일치하면 변경 후 모달 닫고 ALERT 띄우기 
	    
	    return "mypage/pwChange"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	
}
