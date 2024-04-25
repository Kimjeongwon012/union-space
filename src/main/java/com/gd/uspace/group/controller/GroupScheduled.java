package com.gd.uspace.group.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.gd.uspace.group.service.GroupService;

@Component
@EnableScheduling
public class GroupScheduled {
	
	@Autowired GroupService groupservice;
	
	@Scheduled(cron = "0/5 * * * * ?")
	public void groupScheduled() {
		// 모든 모임에 대해 예약 확정 날짜가 지나면 모집 완료로 상태를 변경한다
		groupservice.checkGroupConfirm();
	}
}