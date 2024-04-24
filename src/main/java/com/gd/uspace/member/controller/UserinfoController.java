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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	@ResponseBody
	public String updatePassword(@RequestParam Map<String, String> params, HttpSession session) {
	    //String user_id = params.get("user_id");
		String user_id = (String) session.getAttribute("loginInfo");
	    logger.info("user_id: {}", user_id);
	    String currentPassword = params.get("currentPassword");
	    logger.info("currentPassword: {}", currentPassword);
	    String newPassword = params.get("newPassword");
	    logger.info("newPassword: {}", newPassword);
	    
	    // 세션 및 필수 매개변수 검증
	    if (user_id == null || currentPassword == null || newPassword == null) {
	    	logger.info("누락됨");
	        return "missing_params"; // 필수 매개변수가 누락된 경우
	        
	    }
	    
	    // 현재 비밀번호와 새로운 비밀번호 검증
	    if (!isValidPassword(currentPassword) || !isValidPassword(newPassword)) {
	    	logger.info("비번검증실패");
	        return "invalid_password"; // 비밀번호 형식이 잘못된 경우
	    }
	    
	    // 사용자의 실제 비밀번호 가져오기
	    String realPassword = userinfoservice.getPassword(user_id);
	    logger.info("realpassword: {}",realPassword);
	    
	    // 현재 비밀번호와 실제 비밀번호 비교
	    if (!currentPassword.trim().equals(realPassword.trim())) {
	        logger.info("현재 비밀번호가 일치하지 않습니다.");
	        return "incorrect"; // 현재 비밀번호가 일치하지 않는 경우
	    }
	    
	    // 비밀번호 변경 요청 전달
	    boolean success = userinfoservice.changePassword(user_id, newPassword);
	    logger.info("전달성공");
	    
	    // 요청 결과 반환
	    if (success) {
	        return "success"; // 비밀번호 변경 성공
	    } else {
	        return "incorrect"; // 변경 실패 비밀번호 불일치는 아니다
	    }
	}

	// 비밀번호 유효성 검사 메서드
	private boolean isValidPassword(String password) {
	    // 비밀번호 유효성 검사 로직 구현
	    return true; // 임시로 true 반환
	}
	
	@RequestMapping(value="/userInfoOut", method = RequestMethod.GET)
	public String userInfoOut() {
	    logger.info("회원 탈퇴 페이지로 이동");
	    return "mypage/userInfoOut"; // 회원 정보 수정 페이지의 JSP 파일명
	}
	
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
    @ResponseBody
    public String withdraw(@RequestParam("password") String password, HttpSession session) {
        // 세션에서 사용자 아이디 가져오기
        String userId = (String) session.getAttribute("loginInfo");

        // 사용자 아이디가 없는 경우 또는 비밀번호가 비어 있는 경우 처리
        if (userId == null || password.isEmpty()) {
            return "missing_params"; // 필수 매개변수가 누락된 경우
        }

        // 사용자가 입력한 비밀번호와 실제 비밀번호 확인
        if (!userinfoservice.isValidPassword(userId, password)) {
            return "비밀번호가 일치하지 않습니다."; // 비밀번호가 일치하지 않는 경우
        }

        // 회원 탈퇴 로직 수행
        boolean success = userinfoservice.withdraw(userId, password);

        // 회원 탈퇴 성공 여부에 따라 결과 반환
        if (success) {
            // 세션에서 로그인 정보 삭제
            session.removeAttribute("loginInfo");
            return "success"; // 회원 탈퇴 성공
        } else {
            return "failure"; // 회원 탈퇴 실패
        }
    }
}