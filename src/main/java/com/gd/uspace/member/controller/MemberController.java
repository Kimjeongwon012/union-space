package com.gd.uspace.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.QnADTO;
import com.gd.uspace.member.service.MemberService;

@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService memberservice;
	@Autowired MemberService service;
	
	
	// 문의 게시판 이동
	@RequestMapping(value="/qna/list.go", method=RequestMethod.GET)
	public String goQnAList(HttpSession session, Model model) {
		logger.info("문의 게시판 이동 Controller");
		String page = "help/qnaList";
		
		if(session.getAttribute("loginInfo") != null) {
			String loginId = session.getAttribute("loginInfo").toString();
			String loginType = session.getAttribute("loginType").toString();	
			logger.info("id: "+loginId+"/Type: "+loginType);
			if(loginType == "user") {	// 회원
				model.addAttribute("loginId", loginId);
			}else if(loginType == "admin") {	// 관리자
				page = "/admin/adminQnaList";
			}
		}else {
			model.addAttribute("loginId", null);
		}

		return page;		
	}
	
	// 문의 조회
	@RequestMapping(value="/qna/get/param={qna_no}", method=RequestMethod.GET)
	public String getQnA(@PathVariable("qna_no")String qna_no, Model model) {
		logger.info("QnA 조회 Controller");
		String page = "/help/qnaDetails";
		int idx = Integer.parseInt(qna_no);
//		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("번호: "+idx);
		QnADTO qna = service.getQnA(idx);
		model.addAttribute("result", qna);
//		result.put("QnA", qna);
		
		return page;
	}
		
	// 문의 게시판 리스트 조회
	@ResponseBody
	@RequestMapping(value="/qna/list/get", method=RequestMethod.GET)
	public Map<String, Object> getQnAList(String page) {
		logger.info("QnA 리스트 조회 Controller");
		int currPage = Integer.parseInt(page);
		int start = (currPage-1) * 10;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<QnADTO> list= service.getQnAList(start);
		int QnACnt = service.countQnA();
		
//		logger.info("list size: "+list.size());
//		logger.info("list : "+list);
		logger.info("입력 페이지: "+start);
//		logger.info("currPage: "+currPage);
		logger.info("spaceCnt: "+QnACnt);

		result.put("QnAList", list);
		result.put("currPage", currPage);
		result.put("QnACnt", QnACnt);
		
		return result;
	}
		
	// 문의글 작성 페이지 이동
	@RequestMapping(value="/member/qna/register.go", method=RequestMethod.GET)
	public String goQnAWriteForm(HttpSession session, Model model) {
		logger.info("문의글 작성 페이지 이동");
		String page = "help/qnaWriteForm";
		String loginId = session.getAttribute("loginInfo").toString();
		if(loginId == null) {
			model.addAttribute("loginId", loginId);
			page = "redirect:/help/qnaList";
		}
		return page;
	}	
	// 문의글 작성
	@RequestMapping(value="/member/qna/register", method=RequestMethod.POST)
	public String addQnA(HttpSession session, @RequestParam Map<String,String>param, Model model) {
		logger.info("문의글 작성 Controller");
		String page = "/help/qnaList";
		String msg = "등록 성공";
		if(session.getAttribute("loginInfo") != null) {
			String loginId = session.getAttribute("loginInfo").toString();
			logger.info("id: "+loginId+"/ param: "+param);
			int result = service.addQnA(loginId, param);
			if(result < 1) {
				page = "/help/qnaWriteForm";
				msg = "등록 실패";
			}
			logger.info("장소 등록 result: "+result);
			model.addAttribute("msg", msg);
		}
		return page;
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
		session.removeAttribute("loginType");
		logger.info("로그아웃");
		return "main/main";
	}
	
	@RequestMapping(value="/login.do")
	public String logindo(Model model, HttpSession session, String id, String pw) {
		String page = "member/login";
		logger.info("id : {} / pw : {}",id,pw);
		
		MemberDTO info = memberservice.login(id,pw);
		logger.info("info : {}", info);
		
		if(info != null) {
            if(info.getUser_status() == 0) {
                // 탈퇴된 회원입니다 알림 띄우고 로그인 제한
                model.addAttribute("msg","탈퇴된 회원입니다.");
            } else if (info.getUser_status() == 1) {
                // 로그인 허용
                page = "redirect:/home";
                session.setAttribute("loginInfo", info.getUser_id());
                session.setAttribute("loginType", info.getUser_permission());
                
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
