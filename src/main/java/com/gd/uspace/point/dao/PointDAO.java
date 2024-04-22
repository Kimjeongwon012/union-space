package com.gd.uspace.point.dao;

import java.util.List;

import com.gd.uspace.point.dto.PointDTO;

public interface PointDAO {

	int charge(PointDTO chargeDTO);

	List<PointDTO> list();


}
