package com.gd.uspace.reservation.dao;

import java.util.List;

import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointPageDTO;

public interface ReservationDAO {

	List<GroupDTO> GetGoupList();

	List<GroupDTO> GetGoupList(PointPageDTO ppageDTO);

	int GroupAllCount();

	List<GroupDTO> GetList(PointPageDTO ppageDTO);

	int ResAllCount();

}
