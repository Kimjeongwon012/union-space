package com.gd.uspace.group.service;

import java.sql.Date;
import java.sql.Timestamp;
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
import com.gd.uspace.member.dto.MemberDTO;
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

	// 모임 등록 요청 처리
	public void registerGroup(GroupDTO groupDTO) {
		int user_balance = groupdao.getUserBalance(groupDTO.getUser_id()); // 사용자의 현재 금액 확인
		int space_point = groupdao.getSpacePoint(groupDTO.getSpace_no()); // 대여 금액을 확인
		
		// 보증금(장소 대여 금액 / 모임 모집 최소 인원) 차감 금액을 계산하여 deduct_amout 에 저장한다
		int deduct_amount = space_point / groupDTO.getGroup_lowpeople() * (-1);
		logger.info("user_balance : {}, refund_amount : {}", user_balance, deduct_amount);
		if (user_balance + deduct_amount >= 0) { 
			// 사용자의 현재 잔액에 차감할 포인트 금액을 더한다
			groupdao.addUserBalance(groupDTO.getUser_id(), deduct_amount);
			
			// 데이터베이스에 모임 등록 후 등록한 모임 번호를 groupDTO.group_no 필드에 저장한다
			groupdao.registerGroup(groupDTO);
			// group_no 필드에서 모임번호를 가져와 group_no 변수에 저장한다
			int group_no = groupDTO.getGroup_no();
//			groupDTO.setGroup_no(group_no);
			
			// 포인트 내역에 보증금차감을 기록한다
			PointDTO pointDTO = new PointDTO();
			pointDTO.setGroup_no(group_no);
			pointDTO.setUser_id(groupDTO.getUser_id());
			pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
			pointDTO.setPoint_list("보증금차감");
			pointDTO.setPoint_balance(user_balance + deduct_amount);
			groupdao.insertPointList(pointDTO);
			
			// 모임 인원 현황 테이블에 등록자를 추가한다
			GroupMemberDTO groupMemberDTO = new GroupMemberDTO();
			groupMemberDTO.setGroup_no(group_no);
			groupMemberDTO.setUser_id(groupDTO.getUser_id());
			groupMemberDTO.setGroupmember_permission(1);
			groupdao.insertGroupMember(groupMemberDTO);
		} else {
			logger.info("사용자가 포인트가 부족하여 결제 취소");
		}
	}

	// 모든 모임에 대해 예약 확정 날짜가 지나면 모집 완료로 상태를 변경한다
	public void checkGroupConfirm() {
		// (예약 확정 날짜-모임 날짜 사이이면서 모집중인 모임) 목록에서 
		List<GroupDTO> list = groupdao.checkGroupAfterConfirm(); // 모집완료-모임시작전인 모임
		
		for (GroupDTO g : list) {
			// 모집 인원이 최소를 만족했는지
			if (g.getGroup_people() >= g.getGroup_lowpeople()) {
				// 모임 상태를 모집완료(1)로 변경한다
				groupdao.setGroupState(g.getGroup_no(),1);
				// 모임 인원들의 정보들을 가져와 groupMember 에 저장한다
				List<GroupMemberDTO> groupMember = groupdao.getGroupMembers();
				int space_point = groupdao.getSpacePoint(g.getSpace_no());
				for (GroupMemberDTO m : groupMember) {
					int refund_amount =	space_point / g.getGroup_lowpeople(); 
					int deduct_amount = (space_point / g.getGroup_people()) * (-1);
					// 사용자의 현재 잔액에 반환할 포인트 금액(장소대여금액/모집최소인원수)을 더한다
					groupdao.addUserBalance(m.getUser_id(), refund_amount);
					// 사용자의 현재 잔액에 차감할 포인트 금액(장소대여금액/모집된인원수)을 뺀다
					groupdao.addUserBalance(m.getUser_id(), deduct_amount);
					
					PointDTO pointDTO = new PointDTO();
					pointDTO.setGroup_no(g.getGroup_no());
					pointDTO.setUser_id(m.getUser_id());
					pointDTO.setPoint_balance(groupdao.getUserBalance(m.getUser_id()));
					pointDTO.setPoint_price(refund_amount);
					pointDTO.setPoint_list("보증금반환");
					// 포인트 내역에 보증금반환을 기록한다
					groupdao.insertPointList(pointDTO);
					pointDTO.setPoint_price(deduct_amount); // 차감 사용 등은 음수로 표기
					pointDTO.setPoint_list("보증금차감");
					// 포인트 내역에 보증금차감을 기록한다
					groupdao.insertPointList(pointDTO);
				}
			} else {
				// 모임 상태를 모집실패(2)로 변경한다
				groupdao.setGroupState(g.getGroup_no(),2);
			}
		}
	}

	public GroupDTO getGroupInfo(int group_no) {
		return groupdao.getGroupInfo(group_no);
	}

	public List<MemberDTO> getGroupMemberList(int group_no) {
		return groupdao.getGroupMemberList(group_no);
	}

	public MemberDTO getGroupRegistrant(int group_no) {
		return groupdao.getGroupRegistrant(group_no);
	}

	public int getdDay(int group_no) {
        GroupDTO groupDTO = groupdao.getGroupInfo(group_no);
        //Date confirmDate = new SimpleDateFormat("yyyy/MM/dd").format(groupDTO.getGroup_confirm());
        //Date confirmDate = Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(groupDTO.getGroup_confirm().toString()));
        long timestamp = groupDTO.getGroup_confirm().getTime(); // 타임스탬프 가져오기
        java.util.Date confirmDate = new java.util.Date(timestamp);
        Date nowDate = new Date(System.currentTimeMillis());

        long diffSec = (confirmDate.getTime() - nowDate.getTime()) / 1000; // 초 차이
        long diffMin = (confirmDate.getTime() - nowDate.getTime()) / 60000; // 분 차이
        long diffHor = (confirmDate.getTime() - nowDate.getTime()) / 3600000; // 시 차이
        long diffDays = (confirmDate.getTime() - nowDate.getTime()) / (24 * 60 * 60 * 1000); // 일 차이

        System.out.println(diffSec + "초 차이");
        System.out.println(diffMin + "분 차이");
        System.out.println(diffHor + "시 차이");
        System.out.println(diffDays + "일 차이");

        return (int) diffDays;

	}
}
