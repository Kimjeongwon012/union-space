package com.gd.uspace.group.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.group.dao.GroupDAO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.group.dto.GroupMemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Service
public class GroupService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GroupDAO groupdao;
	
	public SpaceDTO getSpaceInfo(String space_no) {
		SpaceDTO spaceDTO = groupdao.getSpaceInfo(space_no);
		return spaceDTO;
	}

	public boolean registerGroup(GroupDTO groupDTO) {
		int user_balance = groupdao.getUserBalance(groupDTO.getUser_id()); // 사용자의 현재 금액 확인
		int deduct_amount = groupdao.getPaymentAmount(groupDTO.getSpace_no()); // 대여 금액을 확인
		// 모임을 등록한 사용자가 (장소 대여 금액 / 모임 모집 최소 인원) 만큼 포인트를 가지고 있는지 확인
		deduct_amount = deduct_amount / groupDTO.getGroup_lowpeople() * (-1);
		logger.info("user_balance : {}, refund_amount : {}", user_balance, deduct_amount);
		if (user_balance + deduct_amount >= 0) { 
			// 보증금 차감 후 변경에 성공 여부를 row 에 저장
			int row = groupdao.setUserBalance(groupDTO.getUser_id(), deduct_amount);
			if (row == 1 ? true : false) {
				// 모임 테이블에는 모임을 등록한다 group_state:0, group_people:-1
				// 모집이 완료되지 않아서 -1 로 저장한다
				groupdao.registerGroup(groupDTO);
				int group_no = groupDTO.getGroup_no();
				logger.info("group_no : {}", group_no);
				groupDTO.setGroup_no(group_no);
				// 포인트 내역에도 보증금차감을 기록
				PointDTO pointDTO = new PointDTO();
				pointDTO.setGroup_no(group_no);
				pointDTO.setUser_id(groupDTO.getUser_id());
				pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
				pointDTO.setPoint_list("보증금차감");
				groupdao.insertPointList(pointDTO);
				// 먼저 모임에 넣고 모임 인원 현황 테이블에 권한을 모임 등록자인 1로 추가한다 참여상태 1
				GroupMemberDTO groupMemberDTO = new GroupMemberDTO();
				groupMemberDTO.setGroup_no(group_no);
				groupMemberDTO.setUser_id(groupDTO.getUser_id());
				groupMemberDTO.setGroupmember_permission(1);
				groupdao.insertGroupMember(groupMemberDTO);
				logger.info("보증금 차감 성공");
			} else { // 보증금 차감 실패시
				logger.info("보증금 차감 실패");
			}
			return true;
		} else {
			logger.info("사용자가 포인트가 부족하여 결제 취소");
		}
		return false;
	}

	public void checkGroupConfirm() {
		LocalTime now = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
		String formatedNow = now.format(formatter);
		// System.out.println(formatedNow);
		// List<GroupDTO> list = groupdao.checkGroupConfirm(); // 현재 모집 중인 모임
		List<GroupDTO> list = groupdao.checkGroupAfterConfirm(); // 모집완료-모임시작전인 모임
		
		
		for (GroupDTO g : list) {
//			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String confirmDate = dateFormat.format(g.getGroup_confirm());
//			String startDate = dateFormat.format(g.getGroup_starttime());
//			// System.out.print("현재 모집중인 모임 목록");
//			System.out.print("모집완료-모임시작전인 모임 목록");
//			System.out.print("모임 번호 :" + g.getGroup_no());
//			System.out.print(", 예약 확정 날짜 :" + confirmDate);
//			System.out.print(", 모이는 날짜 :" + startDate);
//			System.out.println();
			
			// (예약 확정 날짜-모임 날짜 사이이면서 모집중인 모임) 목록에서 
			// 모집 인원이 최소를 만족했는지
			logger.info("모임 번호 : {}, 모집 인원 : {}", g.getGroup_no(), g.getGroup_people());
			if (g.getGroup_people() >= g.getGroup_lowpeople()) {
				// 예 - 모임 상태를 모집 완료로 변경한다
				groupdao.setGroupState(g.getGroup_no(),1);
				List<GroupMemberDTO> groupMember = groupdao.getGroupMembers();
				int space_point = groupdao.getSpacePoint(g.getSpace_no());
				for (GroupMemberDTO m : groupMember) {
					int refund_amount =	space_point / g.getGroup_lowpeople(); 
					int deduct_amount = (space_point / g.getGroup_people()) * (-1);
					// - 모임에 참여중인 모든 사용자(나간사람 제외)에게 현재 금액에 보증금만큼 더해줌
					groupdao.setUserBalance(m.getUser_id(), refund_amount);
					// - 모임에 참여중인 모든 사용자(나간 사람 제외)에게 현재 금액에 보증금만큼 빼준다
					groupdao.setUserBalance(m.getUser_id(), deduct_amount);
					PointDTO pointDTO = new PointDTO();
					pointDTO.setGroup_no(g.getGroup_no());
					pointDTO.setUser_id(m.getUser_id());
					pointDTO.setPoint_price(refund_amount);
					pointDTO.setPoint_list("보증금반환");
					// - 모임에 참여중인 모든 사용자(나간사람 제외)들은 포인트 테이블에 보증금반환 내역 기록
					groupdao.insertPointList(pointDTO);
					logger.info("보증금 반환 사용자 이름 : {}, 금액 : {}", m.getUser_id(), refund_amount);
					pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
					pointDTO.setPoint_list("보증금차감");
					// - 모임에 참여중인 모든 사용자(나간 사람 제외)들은 포인트 테이블에 보증금차감 내역 기록
					groupdao.insertPointList(pointDTO);
					logger.info("보증금 반환 사용자 이름 : {}, 금액 : {}", m.getUser_id(), deduct_amount);
				}
			} else {
				// 아니요 - 모임 상태를 모집 실패로 변경한다
				groupdao.setGroupState(g.getGroup_no(),2);
			}
		}
	}
}
