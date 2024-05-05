package com.gd.uspace.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.member.dto.MemberDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.point.dto.PointPageDTO;

public interface PointDAO {

	int charge(int point_price, int sum);

	List<MemberDTO> lastpoint();
	
	int updatePoint(@Param("point_price") int point_price, String userId);

	int getUserPoint();

	List<PointDTO> PointGet(PointPageDTO ppageDTO);

	int PointGetAllCount(PointPageDTO ppageDTO);

	List<PointDTO> UserPointList();

	List<PointDTO> UserPointList(PointPageDTO ppageDTO);

	int UserPointListAllCount(PointPageDTO ppageDTO);

}
