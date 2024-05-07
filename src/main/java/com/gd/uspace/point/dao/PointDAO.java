package com.gd.uspace.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

public interface PointDAO {

	List<MemberDTO> lastpoint(String userId);
	
	List<PointDTO> PointGet(PointPageDTO ppageDTO);

	int PointGetAllCount(PointPageDTO ppageDTO);

	int charge(@Param("userId") String userId, @Param("point_price") int point_price, @Param("new_balance") int new_balance);

	int updatePoint(@Param("point_price") int point_price, @Param("userId") String userId);
	
	int getUserPoint(String userId);
	//int charge(String userId, int sum, int point_price);
	

	
	
	//int PointGetAllCount(PointPageDTO ppageDTO);

	List<PointDTO> UserPointList(PointPageDTO ppageDTO);

	int UserPointListAllCount(PointPageDTO ppageDTO);

	

}
