package com.gd.uspace.point.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;

	@RequestMapping(value="/point/list")
	public String pointlist(Model model) {
		logger.info("포인트 내역 조회 페이지");
		List<PointDTO> list = pointservice.list();
		logger.info("1");
		model.addAttribute("list", list);
		logger.info("포인트 :{}",list);
		return "mypage/point";
	}
}
