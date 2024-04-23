package com.gd.uspace.space.dao;

import java.util.HashMap;
import java.util.List;

import com.gd.uspace.space.dto.SpaceAnswerDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceImageDTO;
import com.gd.uspace.space.dto.SpaceOperatingDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;
import com.gd.uspace.space.dto.SpaceReviewPaginationDTO;

public interface SpaceDAO {

	SpaceDTO getSpaceInfo(int space_no);

	List<SpaceImageDTO> getSpaceImage(int space_no);

	List<SpaceQuestionDTO> getSpaceQuestion(int space_no);

	List<SpaceAnswerDTO> getSpaceAnswer(int space_no);

	List<SpaceOperatingDTO> getSpaceOperating(int space_no);

	List<SpaceReviewDTO> getSpaceReview(SpaceReviewPaginationDTO pageDTO);

}
