package com.gd.uspace.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;

public interface PointDAO {

	int charge(int point_price, int sum);

	List<MemberDTO> lastpoint();

	//int updatePoint(@Param("user_id") String user_id, @Param("point_price") int point_price);
	
	int updatePoint(@Param("point_price") int point_price);

	int getUserPoint();

	List<PointDTO> selectResult(Map<String, String> param);

}
