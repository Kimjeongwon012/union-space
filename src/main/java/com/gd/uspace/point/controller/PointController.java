package com.gd.uspace.point.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.service.PointService;

@Controller
public class PointController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointService pointservice;

<<<<<<< HEAD
=======
	@RequestMapping(value="/")
	public String pointLista(Model model) {
		logger.info("포인트 내역 조회 페이지");
		List<PointDTO> pointList = pointservice.pointList();
		logger.info("1");
		model.addAttribute("pointList", pointList);
		logger.info("포인트 :",pointList);
		return "mypage/point";
	}
	
>>>>>>> origin/master
}
