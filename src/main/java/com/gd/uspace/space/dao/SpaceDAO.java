package com.gd.uspace.space.dao;

import com.gd.uspace.space.dto.SpaceDTO;

public interface SpaceDAO {

	int addSpace(SpaceDTO dto);

	void addTimeTable(int idx, int day, int start, int end);

	void uploadPhotos(int idx, String fileName, String newFileName, int photType);

	



}
