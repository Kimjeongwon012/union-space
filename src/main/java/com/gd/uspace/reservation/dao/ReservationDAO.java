package com.gd.uspace.reservation.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointPageDTO;
import com.gd.uspace.reservation.dto.EvaluateDTO;
import com.gd.uspace.reservation.dto.EvaluateItemDTO;
import com.gd.uspace.reservation.dto.EvaluateListDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

public interface ReservationDAO {


	List<GroupDTO> GetGoupList(PointPageDTO ppageDTO);

	int GroupAllCount(String user_id);

	List<GroupDTO> GetList(PointPageDTO ppageDTO);

	int ResAllCount(String user_id);

	int writeReview(SpaceReviewDTO srDTO);

	int selectSpaceNo(SpaceReviewDTO srDTO);

	int selectSpaceNo(Map<String, String> params);

	void writeReview(Map<String, String> params);

	List<EvaluateListDTO> getEvaluateList(String group_no, String user_id);

	List<EvaluateItemDTO> getEvaluateItemList();

	void addEvaluate(EvaluateDTO evaluateDTO);

	void addEvaluateDetail(int attendance_no, int item_no);

	void updateMannerScore(String string, double totalScore);

}
