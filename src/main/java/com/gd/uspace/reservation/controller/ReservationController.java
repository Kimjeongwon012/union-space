package com.gd.uspace.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/reservation/get.do")
	public String resGet() {
		return "reservation/reservationGet";
	}
}
