package com.gd.uspace.space.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gd.uspace.space.dto.SpaceDTO;
import java.util.List;

import com.gd.uspace.space.dto.PhotoDTO;
import com.gd.uspace.space.dto.SpaceAnswerDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceImageDTO;
import com.gd.uspace.space.dto.SpaceOperatingDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;
import com.gd.uspace.group.dto.GroupDTO;
import com.gd.uspace.point.dto.PointDTO;
import com.gd.uspace.space.dto.PaginationDTO;

public interface SpaceDAO {

	SpaceDTO getSpaceInfo(int space_no);

	List<SpaceQuestionDTO> getSpaceQuestion(int space_no);

	SpaceAnswerDTO getSpaceAnswer(int space_no);

	List<SpaceOperatingDTO> getSpaceOperating(int space_no);
	
	int addSpace(SpaceDTO dto);

	void addTimeTable(int idx, int day, int start, int end);

	void uploadPhotos(int idx, String fileName, String newFileName, int photType);

	List<PhotoDTO> getFiles(String idx);

	List<SpaceDTO> getSpaceList();
 
	int delSpace(String idx);

	int getRsvCnt(String idx);

	List<SpaceReviewDTO> getSpaceReview(PaginationDTO pageDTO);

	int getReviewAllPageCount();

	List<SpaceQuestionDTO> getSpaceQna(PaginationDTO pageDTO);

	int getQuestionAllPageCount();

	void insertQuestion(int space_no, String user_id, String content);

	SpaceDTO getSpaceById(Integer space_no);


	int updateSpace(SpaceDTO dto);

	List<SpaceImageDTO> getSpacePhotos(int space_no);

	SpaceImageDTO getSpaceMainPhoto(int space_no);

	void addUserBalance(String user_id, int deduct_amount);

	int getUserBalance(String user_id);

	int getSpacePoint(int space_no);

	void registerGroup(GroupDTO groupDTO);

	void insertPointList(PointDTO pointDTO);

	List<GroupDTO> getGroupList(int space_no);


}
