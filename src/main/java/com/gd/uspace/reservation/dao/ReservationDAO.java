package com.gd.uspace.reservation.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointPageDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

public interface ReservationDAO {


	List<GroupDTO> GetGoupList(PointPageDTO ppageDTO);

	//int GroupAllCount(Date startdate, Date enddate);

	List<GroupDTO> GetList(PointPageDTO ppageDTO);

	int ResAllCount();

	int writeReview(SpaceReviewDTO srDTO);

	int selectSpaceNo(SpaceReviewDTO srDTO);

	int selectSpaceNo(Map<String, String> params);

	void writeReview(Map<String, String> params);


}
