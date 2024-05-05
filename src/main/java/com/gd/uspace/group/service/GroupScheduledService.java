package com.gd.uspace.group.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dao.GroupDAO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.group.dto.PenaltyDTO;
import com.gd.uspace.point.dto.PointDTO;

@Service
public class GroupScheduledService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GroupDAO dao;
	
	public void checkWarningCount() {
		// 경고 횟수가 5의 배수이고
		List<PenaltyDTO> user_list = dao.getUsersWarningCount();
		for (PenaltyDTO p : user_list) {
			// 로그인 제한 해제
			dao.setUserStatus(p.getUser_id(), 1);			
		}
	}
	
	// 모든 모임에 대해 예약 확정 날짜가 지나면 모집 완료로 상태를 변경한다
	public void checkGroupConfirm() {
		// (예약 확정 날짜-모임 날짜 사이이면서 모집중인 모임) 목록에서 
		List<GroupDTO> group0list = dao.checkGroupAfterConfirm(); // 모집완료-모임시작전인 모임
		List<GroupDTO> group1list = dao.checkGroupAfterEndTime();
		List<GroupDTO> group5list = dao.checkGroupBeforeConfirm(); // 예약중-예약확정 
		
		for (GroupDTO g : group0list) {
			// 모집 인원이 최소를 만족했는지
			if (g.getGroup_people() >= g.getGroup_lowpeople()) {
				// 모임 상태를 모집완료(1)로 변경한다
				dao.setGroupState(g.getGroup_no(),1);
				// 모임 인원들의 정보들을 가져와 groupMember 에 저장한다
				List<GroupMemberDTO> groupMember = dao.getGroupMembers(g.getGroup_no());
				
				int space_point = dao.getSpacePoint(g.getSpace_no());
				for (GroupMemberDTO m : groupMember) {
					int refund_amount =	space_point / g.getGroup_lowpeople(); 
					int deduct_amount = (space_point / g.getGroup_people()) * (-1);
					// 사용자의 현재 잔액에 반환할 포인트 금액(장소대여금액/모집최소인원수)을 더한다
					dao.addUserBalance(m.getUser_id(), refund_amount);
					// 사용자의 현재 잔액에 차감할 포인트 금액(장소대여금액/모집된인원수)을 뺀다
					dao.addUserBalance(m.getUser_id(), deduct_amount);
					
					PointDTO pointDTO = new PointDTO();
					pointDTO.setGroup_no(g.getGroup_no());
					pointDTO.setUser_id(m.getUser_id());
					pointDTO.setPoint_balance(dao.getUserBalance(m.getUser_id()));
					pointDTO.setPoint_price(refund_amount);
					pointDTO.setPoint_list("보증금반환");
					// 포인트 내역에 보증금반환을 기록한다
					dao.insertPointList(pointDTO);
					pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
					pointDTO.setPoint_list("보증금차감");
					// 포인트 내역에 보증금차감을 기록한다
					dao.insertPointList(pointDTO);
				}
			} else {
				// 모임 상태를 모집실패(2)로 변경한다
				dao.setGroupState(g.getGroup_no(),2);
			}
		}
		for (GroupDTO g : group5list) {
			// 모임 상태를 예약 확정(6)로 변경한다
			dao.setGroupState(g.getGroup_no(),6);
		}
		for (GroupDTO g : group1list) {
			// 모임 상태를 사용 완료(4)로 변경한다
			dao.setGroupState(g.getGroup_no(), 4);
		}
	}
}
