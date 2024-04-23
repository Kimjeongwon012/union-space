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
public class TestScheduled {
	
	@Autowired GroupService groupservice;
	
	@Scheduled(cron = "0/5 * * * * ?")
	public void test() {
		groupservice.checkGroupConfirm();
	}
}