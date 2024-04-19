package com.gd.uspace.member.service;



import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.member.dao.MemberDAO;
import com.gd.uspace.member.dto.MemberDTO;

@Service
public class MemberService {

	
	@Autowired MemberDAO memberdao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public MemberDTO login(String id, String pw) {
		logger.info("Id, Pw 확인");
		return memberdao.login(id,pw);
	}

	public int join(Map<String, String> param) {
		logger.info("회원 가입 param 값");
		int row = memberdao.join(param);
		
		
		return row;
	}

	public int overlay(String id) {
		return memberdao.overlay(id);
	}
	
}
