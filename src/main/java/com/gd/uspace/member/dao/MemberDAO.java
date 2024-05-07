package com.gd.uspace.member.dao;

import java.util.List;
import java.util.Map;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.QnADTO;

public interface MemberDAO {

	MemberDTO login(String id, String pw);

	int join(Map<String, String> param);

	int overlay(String id);

	int addQnA(QnADTO dto);

	List<QnADTO> getQnAList(int page);

	int countQnA();

	QnADTO getQnA(int idx);

}
