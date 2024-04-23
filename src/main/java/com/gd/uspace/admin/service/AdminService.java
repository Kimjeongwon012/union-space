package com.gd.uspace.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.admin.dao.AdminDAO;
import com.gd.uspace.admin.dto.AdminDTO;

@Service
public class AdminService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDAO adminDAO;

	public List<AdminDTO> adminQna_list() {
		return adminDAO.adminQna_list();
	}

	public List<AdminDTO> selectAdminQna(Map<String, String> params) {
		return adminDAO.selectAdminQna(params);
	}



	
	
}
