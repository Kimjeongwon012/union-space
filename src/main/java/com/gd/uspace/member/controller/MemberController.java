package com.gd.uspace.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.service.MemberService;

@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService memberservice;

	// 문의 게시판 페이지 이동
	@RequestMapping(value="/member/qna/list")
	public String goQnAList() {
		logger.info("문의 게시판 이동");
		return "help/qnaList";
	}
	// 문의글 작성 페이지 이동
	@RequestMapping(value="/member/qna/register")
	public String goQnAWriteForm() {
		logger.info("문의글 작성 페이지 이동");
		return "help/qnaWriteForm";
	}
	
	
	// 로그인 페이지 이동
	@RequestMapping(value="/login.go")
	public String login() {
		logger.info("로그인 이동");
		return "member/login";
	}
	
	@RequestMapping(value="/logout.do")
	public String logindo(Model model, HttpSession session) {
		session.removeAttribute("loginInfo");
		logger.info("로그아웃");
		return "main/main";
	}
	
	@RequestMapping(value="/login.do")
	public String logindo(Model model, HttpSession session, String id, String pw) {
		String page = "member/login";
		logger.info("id : {} / pw : {}",id,pw);
		
		MemberDTO info = memberservice.login(id,pw);
		logger.info("loginId : "+info.getUser_id());
		
		if(info != null) {
            if(info.getUser_status() == 0) {
                // 탈퇴된 회원입니다 알림 띄우고 로그인 제한
                model.addAttribute("msg","탈퇴된 회원입니다.");
            } else if (info.getUser_status() == 1) {
                // 로그인 허용
                page = "redirect:/home";
                session.setAttribute("loginInfo", info.getUser_id());
            } else if (info.getUser_status() == 2) {
                // 로그인 제한 상태입니다 알림 띄우고 로그인 제한
                model.addAttribute("msg","로그인 제한 상태입니다.");
            }
        } else {
            model.addAttribute("msg","아이디 또는 비밀번호 확인해주세요");
        }
		
		return page;
		
	}
	  
	// 회원가입 페이지 이동
		@RequestMapping(value="/join.go")
		public String joinForm() {
			logger.info("회원가입 페이지 이동");
			return "member/joinform";
		}
	
	
	//회원가입
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(Model model, @RequestParam Map<String, String> param) {
		String page = "member/joinform";
		String msg = "회원가입에 실패 했습니다.";
		logger.info("param : "+param);
		
		int row = memberservice.join(param);
		logger.info("insert count : " +row);
		
		if(row==1) {
			page = "member/login";
			msg = "회원가입에 성공 했습니다.";
		}
		
		model.addAttribute("msg", msg);
		return page;
	}	
	
	//회원가입 ID 중복체크
	@RequestMapping(value="/overlay.do")
	@ResponseBody
	public Map<String, Object> overlay(String id){
		logger.info("id="+id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", memberservice.overlay(id));
		
		return map;
	}
}
