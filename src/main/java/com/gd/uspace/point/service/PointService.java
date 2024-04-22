package com.gd.uspace.point.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.point.dao.PointDAO;
import com.gd.uspace.point.dto.PointDTO;

@Service
public class PointService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired PointDAO pointDAO;
	
	public int charge(PointDTO chargeDTO) {
		return pointDAO.charge(chargeDTO);
	}

	public List<PointDTO> list() {
		logger.info("{}",pointDAO.list());
		return pointDAO.list();
	}

	

}
