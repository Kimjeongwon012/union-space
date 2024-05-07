package com.gd.uspace.member.service;



import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.member.dao.MemberDAO;
import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.member.dto.QnADTO;
import com.gd.uspace.space.dto.SpaceDTO;

@Service
public class MemberService {
	@Autowired MemberDAO memberdao;
	@Autowired MemberDAO dao;
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
	// QnA 등록
	public int addQnA(String id, Map<String, String> param) {
		QnADTO dto = new QnADTO();
		
		dto.setQna_id(id);
		dto.setQna_title(param.get("qna_title"));
		dto.setQna_pw(param.get("qna_pw"));
		dto.setQna_state(0);	//미답변 상태
		dto.setQna_content(param.get("qna_content"));

		return dao.addQnA(dto);
	}
	// QnA 리스트 조회
	public List<QnADTO> getQnAList(int page) {
		List<QnADTO> list= dao.getQnAList(page);
		return list;
	}
	// QnA 개수 조회
	public int countQnA() {
		return dao.countQnA();
	}

	public QnADTO getQnA(int idx) {
		return dao.getQnA(idx);
	}
	
}
