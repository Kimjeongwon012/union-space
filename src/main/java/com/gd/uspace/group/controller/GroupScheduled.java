package com.gd.uspace.group.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.gd.uspace.group.service.GroupScheduledService;
import com.gd.uspace.group.service.GroupService;

@Component
@EnableScheduling
public class GroupScheduled {
	
	@Autowired GroupScheduledService groupscheduledservice;
	
	@Scheduled(cron = "0/1 * * * * ?")
	public void groupScheduled() {
		// 모든 모임에 대해 예약 확정 날짜가 지나면 모집 완료로 상태를 변경한다
		groupscheduledservice.checkGroupConfirm();
		// 경고 횟수가 5의 배수일시 경고 받은 날짜로부터 5일 로그인 제한 부여한다
		groupscheduledservice.checkWarningCount();
	}
}