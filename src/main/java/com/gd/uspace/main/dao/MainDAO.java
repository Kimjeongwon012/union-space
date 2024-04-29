package com.gd.uspace.main.dao;

import com.gd.uspace.member.dto.MemberDTO;

public interface MainDAO {

	MemberDTO getMemberDTO(String user_id);

}
