package com.gd.uspace.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;

public interface PointDAO {

	int charge(PointDTO chargeDTO);

	List<PointDTO> list();

	List<MemberDTO> lastpoint();

	int currpoint(String user_id);

	//int updatePoint(@Param("user_id") String user_id, @Param("point_price") int point_price);
	
	int updatePoint(@Param("point_price") int point_price);

}
