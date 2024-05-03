package com.gd.uspace.group.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.uspace.group.dao.GroupDAO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.space.dto.SpaceDTO;

@Service
public class GroupService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GroupDAO dao;
	
	// 모임 참여 요청 처리
	public void joinGroup(int group_no, String user_id, RedirectAttributes rttr) {
		GroupDTO groupDTO = dao.getGroupInfo(group_no);
		//SpaceDTO spaceDTO = dao.getSpaceInfo(groupDTO.getSpace_no()); 
		int user_balance =  dao.getUserBalance(user_id);
		int space_point = dao.getSpacePoint(groupDTO.getSpace_no());
		
		// 보증금(장소 대여 금액 / 모임 모집 최소 인원) 차감 금액을 계산하여 deduct_amout 에 저장한다
		int deduct_amount = space_point / groupDTO.getGroup_lowpeople() * (-1);
		
		// 돈이 부족한지 확인
		if (user_balance + deduct_amount >= 0) {
			// 보증금(장소대여금액/모집최소인원) 차감
			dao.addUserBalance(user_id, deduct_amount);
			
			// 보증금 차감한 내역 point 테이블에 기록
			PointDTO pointDTO = new PointDTO();
			pointDTO.setGroup_no(group_no);
			pointDTO.setUser_id(user_id);
			pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
			pointDTO.setPoint_list("보증금차감");
			pointDTO.setPoint_balance(user_balance + deduct_amount);
			dao.insertPointList(pointDTO);


			// 참여함으로써 최대 모집 인원을 넘기지는 않는지
			if (groupDTO.getGroup_people() + 1 <= groupDTO.getGroup_highpeople()) {
				// 모임 인원 테이블에 회원을 추가한다
				GroupMemberDTO groupMemberDTO = new GroupMemberDTO();
				groupMemberDTO.setGroup_no(group_no);
				groupMemberDTO.setUser_id(user_id);
				groupMemberDTO.setGroupmember_permission(0);
				dao.insertGroupMember(groupMemberDTO);
				
				// 	해당 모임의 group_people(현재 모집 인원) 변경
				dao.setGroupPeople(groupDTO.getGroup_no(), groupDTO.getGroup_people() + 1);
			} else {
				rttr.addAttribute("alertMsg", "모임이 꽉찼습니다");
			}
		} else {
			rttr.addAttribute("alertMsg", "모임에 참여하기 위해 포인트가 부족합니다");
		}		
	}
	
	// 모임 나가기 요청 처리
	public void exitGroup(int group_no, String user_id) {
		GroupDTO groupDTO = dao.getGroupInfo(group_no);
		//SpaceDTO spaceDTO = dao.getSpaceInfo(groupDTO.getSpace_no()); 
		int user_balance =  dao.getUserBalance(user_id);
		int space_point = dao.getSpacePoint(groupDTO.getSpace_no());
		
		// 보증금(장소 대여 금액 / 모임 모집 최소 인원) 차감 금액을 계산하여 deduct_amout 에 저장한다
		int refund_amount = space_point / groupDTO.getGroup_lowpeople();
		
		// 보증금(장소대여금액/모집최소인원) 반환
		dao.addUserBalance(user_id, refund_amount);
		
		// 보증금 반환한 내역 point 테이블에 기록
		PointDTO pointDTO = new PointDTO();
		pointDTO.setGroup_no(group_no);
		pointDTO.setUser_id(user_id);
		pointDTO.setPoint_price(refund_amount); // 차감 사용 등은 음수로 표기
		pointDTO.setPoint_list("보증금반환");
		pointDTO.setPoint_balance(user_balance + refund_amount);
		dao.insertPointList(pointDTO);

		// 모임 인원 테이블에서 인원의 참여상태를 나감으로 변경한다
		dao.removeGroupMember(group_no, user_id);
		
		// 해당 모임의 group_people(현재 모집 인원) 변경
		dao.setGroupPeople(groupDTO.getGroup_no(), groupDTO.getGroup_people() - 1);
	}

	// 모임 삭제 요청 처리
	public boolean removeGroup(int group_no, String user_id, HttpSession session) {
		GroupDTO groupDTO = dao.getGroupInfo(group_no);
		int row = dao.isBeforeConfirm(group_no);
		boolean flag = false;
		// 예약 확정 기간 이전인지?
		if (row == 0) {
			// 확정 기간 사이에 삭제했음
			// 패널티 테이블에서 경고 1회 추가한다
			dao.addWarningCount(user_id, 1);
			int warningCount = dao.getUserWarningCount(user_id);
			// 만약 경고 횟수가 5의 배수라면 해당 사용자에게 로그인 제한을 부여한다
			if (warningCount % 5 == 0) {
				dao.setUserStatus(user_id, 2);
				session.removeAttribute("loginInfo");
				flag = true;
			}
		}

		int space_point = dao.getSpacePoint(groupDTO.getSpace_no());
		int refund_amount =	space_point / groupDTO.getGroup_lowpeople();
		List<GroupMemberDTO> groupMember = dao.getGroupMembers(groupDTO.getGroup_no());
		for (GroupMemberDTO m : groupMember) {
			// 삭제시 모든 인원들에게 user 테이블에서 보증금을 반환
			dao.addUserBalance(m.getUser_id(), refund_amount);
			// 보증금반환한 내역은 point 테이블에 기록
			PointDTO pointDTO = new PointDTO();
			pointDTO.setGroup_no(groupDTO.getGroup_no());
			pointDTO.setUser_id(m.getUser_id());
			pointDTO.setPoint_balance(dao.getUserBalance(m.getUser_id()));
			pointDTO.setPoint_price(refund_amount);
			pointDTO.setPoint_list("보증금반환");
			// 포인트 내역에 보증금반환을 기록한다
			dao.insertPointList(pointDTO);
			// groupMember 테이블에서 모든 인원들을 모임 나감 상태(0)로 변경한다
			dao.removeGroupMember(group_no, m.getUser_id());
		} 
		// group 테이블에서 모임 상태를 삭제(3)로 변경한다
		dao.setGroupState(groupDTO.getGroup_no(),3);
		return flag;
	}

	// 모임 등록 요청 처리
	public boolean registerGroup(GroupDTO groupDTO, Model model) {
		int user_balance = dao.getUserBalance(groupDTO.getUser_id()); // 사용자의 현재 금액 확인
		int space_point = dao.getSpacePoint(groupDTO.getSpace_no()); // 대여 금액을 확인
		
		// 보증금(장소 대여 금액 / 모임 모집 최소 인원) 차감 금액을 계산하여 deduct_amout 에 저장한다
		int deduct_amount = space_point / groupDTO.getGroup_lowpeople() * (-1);
		if (user_balance + deduct_amount >= 0) { 
			// 사용자의 현재 잔액에 차감할 포인트 금액을 더한다
			dao.addUserBalance(groupDTO.getUser_id(), deduct_amount);
			
			// 데이터베이스에 모임 등록 후 등록한 모임 번호를 groupDTO.group_no 필드에 저장한다
			dao.registerGroup(groupDTO);
			// group_no 필드에서 모임번호를 가져와 group_no 변수에 저장한다
			int group_no = groupDTO.getGroup_no();
			
			// 포인트 내역에 보증금차감을 기록한다
			PointDTO pointDTO = new PointDTO();
			pointDTO.setGroup_no(group_no);
			pointDTO.setUser_id(groupDTO.getUser_id());
			pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
			pointDTO.setPoint_list("보증금차감");
			pointDTO.setPoint_balance(user_balance + deduct_amount);
			dao.insertPointList(pointDTO);
			
			// 모임 인원 현황 테이블에 등록자를 추가한다
			GroupMemberDTO groupMemberDTO = new GroupMemberDTO();
			groupMemberDTO.setGroup_no(group_no);
			groupMemberDTO.setUser_id(groupDTO.getUser_id());
			groupMemberDTO.setGroupmember_permission(1);
			dao.insertGroupMember(groupMemberDTO);
			
			// 결제 확인 페이지에 보여줄 장소 이름 금액 보여주기
			groupDTO = dao.getGroupInfo(group_no);
			SpaceDTO spaceDTO = dao.getSpaceInfo(groupDTO.getSpace_no());
			model.addAttribute("space_name", spaceDTO.getSpace_name());
			model.addAttribute("space_point", deduct_amount * (-1));
			return true;
		}
		return false;
	}

	// 해당 모임의 정보들을 담아 반환한다
	public GroupDTO getGroupInfo(int group_no) {
		return dao.getGroupInfo(group_no);
	}

	// 해당 모임의 참여자 목록을 담아 반환한다
	public List<MemberDTO> getGroupMemberList(int group_no) {
		return dao.getGroupMemberList(group_no);
	}

	// 해당 모임의 모임장의 정보를 반환한다 
	public MemberDTO getGroupRegistrant(int group_no) {
		return dao.getGroupRegistrant(group_no);
	}

	// 현재 날짜와 예약 확정 날짜와 비교하여 남은 일자를 반환한다
	public int getdDay(int group_no) {
        GroupDTO groupDTO = dao.getGroupInfo(group_no);
        long timestamp = groupDTO.getGroup_confirm().getTime(); // 타임스탬프 가져오기
        java.util.Date confirmDate = new java.util.Date(timestamp);
        Date nowDate = new Date(System.currentTimeMillis());
		
        long diffDays = (confirmDate.getTime() - nowDate.getTime()) / (24 * 60 * 60 * 1000); // 일 차이

        return (int) diffDays;

	}
	
	public SpaceDTO getSpaceInfo(int space_no) {
		SpaceDTO spaceDTO = dao.getSpaceInfo(space_no);
		return spaceDTO;
	}

	public GroupDTO getGroupByNo(int group_no) {
		return dao.getGroupByNo(group_no);
	}

	public void updateGroup(GroupDTO groupDTO) {
		dao.updateGroup(groupDTO);
	}

	public String getSpaceMainImage(int space_no) {
		String fileName = dao.getSpaceMainPhoto(space_no);
		return "/resources/images/spaceImg/" + fileName;
	}
	
}
