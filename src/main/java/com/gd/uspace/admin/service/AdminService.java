package com.gd.uspace.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.admin.dao.AdminDAO;
import com.gd.uspace.admin.dto.AdminDTO;

@Service
public class AdminService {
	@Autowired AdminDAO adminDAO;
	
	public List<AdminDTO> adminQna_list(HashMap data) {
		System.out.println(data);
		return adminDAO.adminQna_list(data);
	}
	
	
	
}
