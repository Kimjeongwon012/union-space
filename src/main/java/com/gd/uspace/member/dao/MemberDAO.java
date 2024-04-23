package com.gd.uspace.member.dao;

import java.util.Map;

import com.gd.uspace.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String id, String pw);

	int join(Map<String, String> param);

	int overlay(String id);

}
