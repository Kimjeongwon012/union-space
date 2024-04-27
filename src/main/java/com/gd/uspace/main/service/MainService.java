package com.gd.uspace.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.main.dao.MainDAO;
import com.gd.uspace.member.dto.MemberDTO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	public MemberDTO getMemberDTO(String user_id) {
		return dao.getMemberDTO(user_id);
	}
	
}
