package com.gd.uspace.group.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.group.service.GroupService;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Controller
public class GroupController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupService groupservice;
	
	@RequestMapping(value="/test")
	public String test() {
		logger.info("테스트 페이지 이동");
		return "/main/header&sidemenu";
	}
	
	@RequestMapping(value="/forceLogin.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> forceLoginAjax(HttpSession session, String user_id) {
		logger.info("강제 로그인/로그아웃 요청");
		Map<String, Object> result = new HashMap<String, Object>();
		if (session.getAttribute("loginInfo") != null) {
			session.removeAttribute("loginInfo"); // 해당 사용자를 로그아웃 상태로 변경
		} else { 
			MemberDTO user = new MemberDTO();
			user.setUser_id(user_id);
			user.setUser_pw("1234");
			session.setAttribute("loginInfo", user.getUser_id()); // 해당 사용자를 로그인 상태로 변경
			result.put("id", user_id);
		}
		return result;
	}
	
	// 모임 등록 처리 요청
	@RequestMapping(value="/group/paymentRegistration.do", method = RequestMethod.POST)
	public String registergo(Model model, HttpSession session, RedirectAttributes rttr) {
		logger.info("모임 등록 처리 요청");
		// 비회원은 로그인 페이지로 이동
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		// 세션에서 예약 정보가 담겨 있는지 확인한다
		} else if (session.getAttribute("groupDTO") != null) {
			GroupDTO groupDTO = (GroupDTO) session.getAttribute("groupDTO");
			
			// 데이터베이스에 모임 정보를 등록한다
			groupservice.registerGroup(groupDTO, rttr);
			session.removeAttribute("groupDTO");
			return "/group/paymentSuccess";
		}
		return "/group/paymentFail";
	}
	
	@RequestMapping(value="/group/paymentJoin.go", method = RequestMethod.POST)
	public String paymentJoingo(int group_no, Model model, HttpSession session) {
		logger.info("모임 참여시 결제 확인 페이지 이동");
		// 로그인 하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		model.addAttribute("group_no", group_no);
		return "/group/paymentJoin";
	}
	
	// 모임 등록 결제 페이지 이동 
	@RequestMapping(value="/group/paymentRegistration.go", method = RequestMethod.POST)
	public String registergo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("모임 등록시 결제 확인 페이지 이동");
		// 로그인 하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		
		// 모임 시작, 종료 시간을 각 변수에 저장한다
		Timestamp group_starttime = java.sql.Timestamp.valueOf(params.get("group_starttime"));
		Timestamp group_endtime = java.sql.Timestamp.valueOf(params.get("group_endtime"));
		
		String user_id = (String) session.getAttribute("loginInfo");
		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setSpace_no(Integer.parseInt(params.get("space_no")));
		groupDTO.setUser_id(user_id);
		groupDTO.setGroup_name(params.get("group_name"));
		groupDTO.setGroup_state("0"); // 모임의 상태는 모집중이다
		groupDTO.setGroup_create_date(new Date(System.currentTimeMillis()));
		groupDTO.setGroup_people(1); // 모임 등록시 인원 수를 1명으로 지정한다 
		groupDTO.setGroup_introduce(params.get("group_introduce")); 
		groupDTO.setGroup_caution(params.get("group_caution"));
		groupDTO.setGroup_confirm(new Timestamp(group_starttime.getTime() - (3 * 24 * 60 * 60 * 1000))); // 예약 확정 날짜는 모임 날짜 3일전이므로 그만큼 빼준다
		groupDTO.setGroup_starttime(group_starttime);
		groupDTO.setGroup_endtime(group_endtime);
		groupDTO.setGroup_lowpeople(Integer.parseInt(params.get("group_lowpeople")));
		groupDTO.setGroup_highpeople(Integer.parseInt(params.get("group_highpeople")));
		model.addAttribute("groupDTO", groupDTO);
		
		// 세션에 모임(예약) 정보를 담아둔다
		session.setAttribute("groupDTO", groupDTO);
		return "/group/paymentRegistration";
	}
	
	// 모임 등록 페이지 이동
	@RequestMapping(value="/group/register.go", method = RequestMethod.POST)
	public String registerdo(@RequestParam Map<String,String> params, Model model, HttpSession session) {
		logger.info("모임 등록 페이지 이동");
		
		// 로그인 하지 않은 사용자는 로그인 페이지로 이동한다
		if (session.getAttribute("loginInfo") == null) {
			return "/member/login";
		}
		int space_no = Integer.parseInt(params.get("space_no"));
		String start_date =  params.get("start_date");
		String end_date =  params.get("end_date");
		String group_people = params.get("group_people"); 
				
		SpaceDTO spaceDTO = groupservice.getSpaceInfo(space_no);
		String user_id = (String) session.getAttribute("loginInfo");
		model.addAttribute("spaceDTO", spaceDTO);
		model.addAttribute("start_date", start_date);
		model.addAttribute("end_date", end_date);
		model.addAttribute("group_people", group_people);
		model.addAttribute("user_id", user_id);
		return "/group/registration";
	}
	
	// 모임 상세보기 페이지 이동
	@RequestMapping(value="/group/detail.go", method = RequestMethod.GET)
	public String detailgo(String alertMsg, int group_no, Model model, HttpSession session) {
		logger.info("모임 상세보기 페이지 이동");
		//logger.info("group_no : {}", group_no);
		// 모임의 상세 정보를 groupDTO 에 저장한다
		GroupDTO groupDTO = groupservice.getGroupInfo(group_no);
		// 모임장을 제외한 모임 인원 목록을 groupMemberList 에 저장한다
		List<MemberDTO> groupMemberList = groupservice.getGroupMemberList(group_no);
		// 모임장의 정보를 groupRegistrant 에 저장한다
		MemberDTO groupRegistrant = groupservice.getGroupRegistrant(group_no);
		//logger.info("groupDTO : {}", groupDTO);
		//logger.info("groupMemberList : {}", groupMemberList);
		//logger.info("groupRegistrant : {}",groupRegistrant);
		// 예역 확정날짜까지 D-DAY 날짜 계산
		int dDay = groupservice.getdDay(group_no);
		// 클라이언트 응답 설정
		// 0: 로그인 안한 사용자, 1: 로그인한 사용자, 2: 모임에 참여중인 사용자, 3: 모임장
		// 4: 모집완료, 5:모집실패, 6:모임삭제, 7:사용완료, 8:개인
		int response = 0;
		String user_id = (String) session.getAttribute("loginInfo");
		// 
		if (groupDTO != null) {
			// 모집 완료(4)
			if (groupDTO.getGroup_state().equals("1")) {
				response = 4;
			// 모집 실패(5)
			} else if (groupDTO.getGroup_state().equals("2")) {
				response = 5;
			// 모임 삭제(6)
			} else if (groupDTO.getGroup_state().equals("3")) {
				response = 6;
			// 장소 사용완료(7)
			} else if (groupDTO.getGroup_state().equals("4")) {
				response = 7;
			}
		}
		// 로그인 한 사용자(1)
		if (response == 0 && user_id != null) {
			response = 1;
			// 모임에 참여중인 사용자(2)
			for (MemberDTO m : groupMemberList) {
				// logger.info("m user_id : {}, s user_id : {}", m.getUser_id(), memberDTO.getUser_id());
				if (m.getUser_id().equals(user_id)) {
					response = 2;
				}
			}
			// 모임을 생성한 사용자, 모임장(3)
			//logger.info("memberDTO : {}, registrant : {}", memberDTO.getUser_id(), groupRegistrant.getUser_id());
			//logger.info("{}", memberDTO.getUser_id().equals(groupRegistrant.getUser_id()));
			if (user_id.equals(groupRegistrant.getUser_id())) {
				response = 3;
			}
		}
		//logger.info("마지막 response :{}", response);
		//logger.info("groupState : {}", groupDTO.getGroup_state());

		// 모델에다가 뿌린다
		model.addAttribute("groupDTO", groupDTO);
		model.addAttribute("groupMemberList", groupMemberList);
		model.addAttribute("groupRegistrant", groupRegistrant);
		model.addAttribute("dDAY", dDay);
		model.addAttribute("response", response);
		model.addAttribute("alertMsg", alertMsg);
		return "/group/detail";
	}
	
	// 모임 참여 요청 처리
	@RequestMapping(value="/group/join.do", method = RequestMethod.POST)
	public String joinDo(int group_no, Model model, HttpSession session, RedirectAttributes rttr) {
		logger.info("모임 참여 요청 group_no : {}", group_no);
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/group/detail.go?group_no=" + group_no;
		}
		String user_id = (String) session.getAttribute("loginInfo");
		
		groupservice.joinGroup(group_no, user_id, rttr);


		return "redirect:/group/detail.go?group_no=" + group_no;
	}
	
	// 모임 나가기 요청 처리
	@RequestMapping(value="/group/exit.do", method = RequestMethod.POST)
	public String exitDo(int group_no, Model model, HttpSession session) {
		logger.info("모임 나가기 요청 group_no : {}", group_no);
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/group/detail.go?group_no=" + group_no;
		}
		String user_id = (String) session.getAttribute("loginInfo");
		
		groupservice.exitGroup(group_no, user_id);
		return "redirect:/group/detail.go?group_no=" + group_no;
	}
	
	// 모임 삭제 요청 처리
	@RequestMapping(value="/group/remove.do", method = RequestMethod.POST)
	public String removeDo(int group_no, Model model, HttpSession session) {
		logger.info("모임 삭제 요청 group_no : {}", group_no);
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/group/detail.go?group_no=" + group_no;
		}
		// 이미 프론트에서 모임을 생성한 사람만 삭제할 수 있게 해둠
		String user_id = (String) session.getAttribute("loginInfo");
		
		groupservice.removeGroup(group_no, user_id);
		return "redirect:/group/detail.go?group_no=" + group_no;
	}
	
	// 모임 수정 요청 처리
	@RequestMapping(value="/group/edit.do", method = RequestMethod.POST)
	public String editDo(@RequestParam int group_no, @RequestParam String group_name, @RequestParam String group_introduce, @RequestParam String group_caution, Model model, HttpSession session) {
	    // 여기에 모임 정보를 업데이트하는 코드를 추가합니다.
	    // group_no를 사용하여 해당 모임의 정보를 가져와서 업데이트합니다.
	    
	    // 예시로 모임 이름과 소개, 주의사항만 업데이트하는 코드를 작성합니다.
	    GroupDTO groupDTO = groupservice.getGroupByNo(group_no); // 모임 번호로 모임 정보를 가져옵니다.
	    groupDTO.setGroup_name(group_name); // 새로운 모임 이름으로 업데이트합니다.
	    groupDTO.setGroup_introduce(group_introduce); // 새로운 모임 소개로 업데이트합니다.
	    groupDTO.setGroup_caution(group_caution); // 새로운 모임 주의사항으로 업데이트합니다.
	    
	    // 모임 정보를 업데이트합니다.
	    groupservice.updateGroup(groupDTO);
	    logger.info("수정완료");
	    // 수정된 모임 정보를 상세 페이지로 리다이렉트합니다.
	    return "redirect:/group/detail.go?group_no=" + group_no;
	}
	
	// 모임 수정 페이지 이동
	@RequestMapping(value="/group/edit.go", method = RequestMethod.GET)
	public String editGo(Integer group_no, Model model, HttpSession session) {
	    if (group_no != null) {
	        logger.info("group_no : {}", group_no);
	        // group_no가 null이 아닌 경우에 대한 처리
	        GroupDTO groupDTO = groupservice.getGroupByNo(group_no); // 수정 페이지에 표시할 모임 정보 가져오기
	        model.addAttribute("groupDTO", groupDTO); // 모임 정보를 모델에 추가
	        int space_no = groupservice.getGroupInfo(group_no).getSpace_no();
	        //SpaceDTO spaceDTO = groupservice.getSpaceInfo(space_no);
	        model.addAttribute("space_no", space_no); 
	    } else {
	        // group_no가 null인 경우에 대한 처리
	    }
	    return "/group/edit"; // 수정 페이지의 뷰 이름
	}
	
}

